class HomeController < ApplicationController
  def run_questionnaire
    

    if params["questionnaire_id"]
      questionnaire = Questionnaire.find params["questionnaire_id"]
      @completing_survey = CompletingSurvey.new
      @completing_survey.questionnaire = questionnaire
      @completing_survey.save!

      @pages = questionnaire.pages.to_a
      render "questionnaire"
    elsif params["completing_survey_id"]
      @completing_survey = CompletingSurvey.find params["completing_survey_id"]
      @answers = []
      @errors = [] 
      params["answers"].each do |question_id, given_answer|
        question = Question.find question_id
        if question.kind == "open_ended"
          answer = Answer.new
          answer.completing_survey = @completing_survey
          answer.question = question
          answer.open_answer = given_answer
          if answer.save
            @answers << answer
          else
            @errors << answer.errors.full_messages.first
          end
        elsif question.kind == "date"
          answer = Answer.new
          answer.completing_survey = @completing_survey
          answer.question = question
          answer.date = given_answer
          if answer.save
            @answers << answer
          else
            @errors << answer.errors.full_messages.first
          end
        elsif question.kind == "single_choice"
          answer = Answer.new
          answer.completing_survey = @completing_survey
          answer.question = question
          answer.single_answer = given_answer
          if answer.save
            @answers << answer
          else
            @errors << answer.errors.full_messages.first
          end
        end
      end 

      if @errors.empty?
        render "thank_you"
      else
        flash[:alert] = @errors.first
        @pages = @completing_survey.questionnaire.pages.to_a
        render "questionnaire"
      end


    
    else
      questionnaire = Questionnaire.first
      @completing_survey = CompletingSurvey.new
      @completing_survey.questionnaire = questionnaire
      @completing_survey.save!

      @pages = questionnaire.pages.to_a
      render "questionnaire" 
    end
  end
end