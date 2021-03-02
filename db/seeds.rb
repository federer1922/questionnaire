# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

return if Questionnaire.first

questionnaire_1 = Questionnaire.create!(name: "Bikes")

page_1 = Page.create!(number: 1, questionnaire: questionnaire_1)
question_1 = Question.create!(kind: "open_ended", content: "What is your name and how often do you cycle?", page: page_1, requiring_answer: "yes")
question_2 = Question.create!(kind: "date", content: "What is your date of birth?", page: page_1, requiring_answer: "yes")
question_3 = Question.create!(kind: "single_choice", content: "What kind of bike do you prefer?", select_possible_answers: "road,mountain,hybrid,different", page: page_1, requiring_answer: "yes")


page_2 = Page.create!(number: 2, questionnaire: questionnaire_1)
question_4 = Question.create!(kind: "open_ended", content: "What do you like about cycling?", page: page_2, requiring_answer: "yes")
question_5 = Question.create!(kind: "date", content: "When was the last time you went for a bike ride?", page: page_2, requiring_answer: "yes")
question_6 = Question.create!(kind: "single_choice", content: "How long are yours bike rides?", select_possible_answers: "less than 10 miles,around 20 miles,more than 20 miles", page: page_2, requiring_answer: "yes")

questionnaire_2 = Questionnaire.create!(name: "Computers")

page_3 = Page.create!(number: 1, questionnaire: questionnaire_2)
question_7 = Question.create!(kind: "open_ended", content: "What is your name and how long do you use a computer a day?", page: page_3)
question_8 = Question.create!(kind: "date", content: "What is your date of birth?", page: page_3)
question_9 = Question.create!(kind: "single_choice", content: "What kind of operating system do you prefer?", select_possible_answers: "Windows,Linux,Mac", page: page_3)


page_4 = Page.create!(number: 2, questionnaire: questionnaire_2)
question_10 = Question.create!(kind: "open_ended", content: "What are tha advantages/disadvantages of internet?", page: page_4)
question_11 = Question.create!(kind: "date", content: "When was the last time you spent more than 3 hours playing video games or surfing the internet?", page: page_4)
question_12 = Question.create!(kind: "single_choice", content: "What for do you use your computer mostly?", select_possible_answers: "work/school,games,other", page: page_4)

puts "database has questionnaires: #{Questionnaire.pluck(:name)}"


