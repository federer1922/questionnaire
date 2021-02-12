require "rails_helper"

describe QuestionnairesController, type: :controller do
  #render_views

  it "creates questionnaire" do
    get :create, params: { name: "Health Questionnaire" }
    get :create, params: { name: "Health Questionnaire" }
    get :create, params: { name: "Diet Questionnaire" }

    questionnaire = Questionnaire.first
    expect(questionnaire.name).to eq "Health Questionnaire"
    questionnaire = Questionnaire.last
    expect(questionnaire.name).to eq "Diet Questionnaire"
    expect(Questionnaire.count).to eq 2
  end

end