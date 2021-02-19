class HomeController < ApplicationController
  def run_questionnaire

    if params["questionnaire_id"]
      questionnaire = Questionnaire.find params["questionnaire_id"]
      completing_survey = CompletingSurvey.new
      completing_survey.questionnaire = questionnaire
      completing_survey.save!

      @pages = questionnaire.pages.to_a
      render "questionnaire"
    elsif params["completing_survey_id"]
      completing_survey = CompletingSurvey.find params["completing_survey_id"]

      params["answers"].each do |question_id, given_answer|
        question = Question.find question_id
        if question.kind == "open_ended"
          answer = Answer.new
          answer.completing_survey = completing_survey
          answer.question = question
          answer.open_ended_question = given_answer
          answer.save!
        elsif question.kind == "date"
          answer = Answer.new
          answer.completing_survey = completing_survey
          answer.question = question
          answer.date_selection = given_answer
          answer.save!
        elsif question.kind == "single_choice"
          answer = Answer.new
          answer.completing_survey = completing_survey
          answer.question = question
          answer.single_choice_question = given_answer
          answer.save!
        end
      end
      render "thank_you"
    
    else
      questionnaire = Questionnaire.first
      completing_survey = CompletingSurvey.new
      completing_survey.questionnaire = questionnaire
      completing_survey.save!

      @pages = questionnaire.pages.to_a
      render "questionnaire" 
    end


  





    
    # completing_survey_already_in_database = CompletingSurvey.where(questionnaire_id: params["questionnaire_id"]).first  
    # questionnaire = Questionnaire.find params["questionnaire_id"]
    
    # if completing_survey_already_in_database.nil?
    #   completing_survey = CompletingSurvey.new
    #   completing_survey.questionnaire = questionnaire
    #   completing_survey.save!
    # end

    # page_1 = questionnaire.pages.first

    # question_1 = page_1.questions.first

    # answer_1 = Answer.new
    # answer_1.completing_survey = completing_survey
    # answer_1.question = question_1
    # if question_1.kind == "open_ended"
    #   answer_1.open_ended_question = params["answer_first"]
    #   answer_1.save!
    # elsif question_1.kind == "date"
    #   answer_1.date_selection = params["answer_first"]
    #   answer_1.save!
    # else question_1.kind == "single_choice"
    #   answer_1.single_choice_question = params["answer_first"]
    #   answer_1.save!
    # end

    # question_2 = page_1.questions.second

    # answer_2 = Answer.new
    # answer_2.completing_survey = completing_survey
    # answer_2.question = question_2
    # if question_2.kind == "open_ended"
    #   answer_2.open_ended_question = params["answer_second"]
    #   answer_2.save!
    # elsif question_2.kind == "date"
    #   answer_2.date_selection = params["answer_second"]
    #   answer_2.save!
    # else question_2.kind == "single_choice"
    #   answer_2.single_choice_question = params["answer_second"]
    #   answer_2.save!
    # end

    # question_3 = page_1.questions.third

    # answer_3 = Answer.new
    # answer_3.completing_survey = completing_survey
    # answer_3.question = question_3
    # if question_3.kind == "open_ended"
    #   answer_3.open_ended_question = params["answer_third"]
    #   answer_3.save!
    # elsif question_3.kind == "date"
    #   answer_3.date_selection = params["answer_third"]
    #   answer_3.save!
    # else question_3.kind == "single_choice"
    #   answer_3.single_choice_question = params["answer_third"]
    #   answer_3.save!
    # end

    # page_2 = questionnaire.pages.second

    # question_4 = page_2.questions.first

    # answer_4 = Answer.new
    # answer_4.completing_survey = completing_survey
    # answer_4.question = question_4
    # if question_4.kind == "open_ended"
    #   answer_4.open_ended_question = params["answer_fourth"]
    #   answer_4.save!
    # elsif question_1.kind == "date"
    #   answer_4.date_selection = params["answer_fourth"]
    #   answer_4.save!
    # else question_1.kind == "single_choice"
    #   answer_4.single_choice_question = params["answer_fourth"]
    #   answer_4.save!
    # end

    # question_5 = page_2.questions.second

    # answer_5 = Answer.new
    # answer_5.completing_survey = completing_survey
    # answer_5.question = question_5
    # if question_5.kind == "open_ended"
    #   answer_5.open_ended_question = params["answer_fifth"]
    #   answer_5.save!
    # elsif question_5.kind == "date"
    #   answer_5.date_selection = params["answer_fifth"]
    #   answer_5.save!
    # else question_5.kind == "single_choice"
    #   answer_5.single_choice_question = params["answer_fifth"]
    #   answer_5.save!
    # end

    # question_6 = page_2.questions.third

    # answer_6 = Answer.new
    # answer_6.completing_survey = completing_survey
    # answer_6.question = question_6
    # if question_6.kind == "open_ended"
    #   answer_6.open_ended_question = params["answer_sixth"]
    #   answer_6.save!
    # elsif question_6.kind == "date"
    #   answer_6.date_selection = params["answer_sixth"]
    #   answer_6.save!
    # else question_6.kind == "single_choice"
    #   answer_6.single_choice_question = params["answer_sixth"]
    #   answer_6.save!
    # end
  end
end