class QuestionnairesController < ApplicationController

  def create
    
    questionnaire_already_in_database = Questionnaire.where(name: params["name"]).first

    if questionnaire_already_in_database.nil?
      questionnaire = Questionnaire.new
      questionnaire.name = params["name"]
      if questionnaire.save
        redirect_to action: "index"
      else
        flash[:alert] = questionnaire.errors.full_messagers.first
        redirect_to action: "index"
      end
    else
      flash[:alert] = "Questionnaire name already exist"
      redirect_to action: "index"
    end
  end

  def index
    
    @questionnaires = Questionnaire.all.order(:created_at)
    @pages = Pages.all.order(:created_at)
  end

  def add_page_to_questionnaire

    questionnaire = Questionnaire.find params ["questionnaire_id"]
    page = Page.new
  end


end
