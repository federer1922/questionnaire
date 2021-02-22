Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#run_questionnaire"

  post '/run_questionnaire', to: 'home#run_questionnaire'

end
