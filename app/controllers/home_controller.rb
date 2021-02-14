class HomeController < ApplicationController
  def run_questionnaire
    
   
    completing_survey_already_in_database = CompletingSurvey.where(questionnaire_id: params["questionnaire_id"]).first  
    questionnaire = Questionnaire.find params["questionnaire_id"]
    
    if completing_survey_already_in_database.nil?
      completing_survey = CompletingSurvey.new
      completing_survey.questionnaire = questionnaire
      completing_survey.save!
    end


    page_1 = questionnaire.pages.first
    question_1 = page_1.questions.first
    completing_survey = CompletingSurvey.first

    answer_1 = Answer.new
    answer_1.completing_survey = completing_survey
    answer_1.question = question_1
    if question_1.kind = "open_ended"
      answer_1.open_ended_question = params["question_1_answer"]
      answer_1.save!
    elsif question_1.kind = "date"
      answer_1.date_selection = params["question_1_answer"]
      answer_1.save!
    else question_1.kind = "single_choice"
      answer_1.single_choice_question = params["question_1_answer"]
      answer_1.save!
    end

    page_1 = questionnaire.pages.first
    question_2 = page_1.questions.second
    completing_survey = CompletingSurvey.first

    answer_2 = Answer.new
    answer_2.completing_survey = completing_survey
    answer_2.question = question_2
    if question_2.kind = "open_ended"
      answer_2.open_ended_question = params["question_2_answer"]
      answer_2.save!
    elsif question_2.kind = "date"
      answer_2.date_selection = params["question_2_answer"]
      answer_2.save!
    else question_2.kind = "single_choice"
      answer_2.single_choice_question = params["question_2_answer"]
      answer_2.save!
    end

    page_1 = questionnaire.pages.first
    question_3 = page_1.questions.third
    completing_survey = CompletingSurvey.first

    answer_3 = Answer.new
    answer_3.completing_survey = completing_survey
    answer_3.question = question_3
    if question_3.kind = "open_ended"
      answer_3.open_ended_question = params["question_3_answer"]
      answer_3.save!
    elsif question_3.kind = "date"
      answer_3.date_selection = params["question_3_answer"]
      answer_3.save!
    else question_3.kind = "single_choice"
      answer_3.single_choice_question = params["question_3_answer"]
      answer_3.save!
    end




  end


end