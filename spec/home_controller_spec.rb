require "rails_helper"

describe HomeController, type: :controller do
  render_views

  it "is completing survey" do

    questionnaire_1 = Questionnaire.create!(name: "Bike")

    page_1 = Page.create!(number: 1, questionnaire: questionnaire_1)
    question_1 = Question.create!(kind: "open_ended", content: "What is your name and how often do you cycle?", page: page_1)
    question_2 = Question.create!(kind: "date", content: "What is your date of birth?", page: page_1)
    question_3 = Question.create!(kind: "single_choice", content: "What kind of bike do you prefer?", select_possible_answers: "road,mountain,hybrid,different", page: page_1)

    
    page_2 = Page.create!(number: 2, questionnaire: questionnaire_1)
    question_4 = Question.create!(kind: "open_ended", content: "What do you like about cycling?", page: page_2)
    question_5 = Question.create!(kind: "date", content: "When was the last time you went for a bike ride?", page: page_2)
    question_6 = Question.create!(kind: "single_choice", content: "How long are yours bike rides?", select_possible_answers: "less than 10 miles,around 20 miles,more than 20 miles", page: page_2)
  
  
    

    post :run_questionnaire, params: { questionnaire_id: questionnaire_1.id }

    completing_survey = CompletingSurvey.first
    expect(completing_survey.questionnaire).to eq questionnaire_1
    
    post :run_questionnaire, params: { completing_survey_id: completing_survey.id, answers: { question_1.id => "Arek, twice a week", question_2.id => "#{Date.today}", question_3.id => "hybrid",question_4.id => "The freedom, fun and fitness aspects", question_5.id => "#{Date.yesterday}", question_6.id => "more than 20 miles" } }

    expect(question_1.answers.first.open_ended_question).to eq "Arek, twice a week"
    expect(question_1.page.number).to eq 1
    expect(question_2.answers.first.date_selection).to eq Date.today
    expect(question_2.page.number).to eq 1
    expect(question_3.answers.first.single_choice_question).to eq "hybrid"
    expect(question_3.page.number).to eq 1
    expect(question_4.answers.first.open_ended_question).to eq "The freedom, fun and fitness aspects"
    expect(question_4.page.number).to eq 2
    expect(question_5.answers.first.date_selection).to eq Date.yesterday
    expect(question_5.page.number).to eq 2
    expect(question_6.answers.first.single_choice_question).to eq "more than 20 miles" 
    expect(question_6.page.number).to eq 2
  end
end