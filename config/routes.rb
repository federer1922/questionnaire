Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "questionnaires#index"

  get '/create', to: 'questionnaires#create'

  get '/add_page_to_questionnaire', to: 'questionnaires#add_page_to_questionnaire'

end
