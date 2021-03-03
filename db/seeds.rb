# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

return if Questionnaire.first

questionnaire_1 = Questionnaire.create!(name: "Computers")

page_1 = Page.create!(number: 1, questionnaire: questionnaire_1)
question_1 = Question.create!(number: 1, kind: "open_ended", content: "First name", page: page_1, requiring_answer: "yes")
question_2 = Question.create!(number: 2, kind: "date", content: "Birth date", page: page_1, requiring_answer: "yes")

page_2 = Page.create!(number: 2, questionnaire: questionnaire_1)
question_3 = Question.create!(number: 3, kind: "single_choice", content: "OS of choice", select_possible_answers: "Windows,Linux,Mac OS", page: page_2, requiring_answer: "yes")

page_3 = Page.create!(number: 3, questionnaire: questionnaire_1)
question_4 = Question.create!(number: 4, kind: "open_ended", content: "Something about you (140 characters top)", page: page_3, requiring_answer: "yes")


questionnaire_2 = Questionnaire.create!(name: "Bikes")

page_4 = Page.create!(number: 1, questionnaire: questionnaire_2)
question_5 = Question.create!(number: 1, kind: "open_ended", content: "What is your name and how often do you cycle?", page: page_4, requiring_answer: "yes")
question_6 = Question.create!(number: 2, kind: "date", content: "What is your date of birth?", page: page_4, requiring_answer: "yes")
question_7 = Question.create!(number: 3, kind: "open_ended", content: "When did you learn to ride a bicycle and what was your first bike (answer not required)?", page: page_4)
question_8 = Question.create!(number: 4, kind: "single_choice", content: "What kind of bike do you prefer?", select_possible_answers: "Road,Mountain,Hybrid,Different", page: page_4, requiring_answer: "yes")


page_5 = Page.create!(number: 2, questionnaire: questionnaire_2)
question_9 = Question.create!(number: 5, kind: "open_ended", content: "What do you like about cycling?", page: page_5, requiring_answer: "yes")
question_10 = Question.create!(number: 6, kind: "date", content: "When was the last time you went for a bike ride (answer not required)?", page: page_5)
question_11 = Question.create!(number: 7, kind: "single_choice", content: "How long are yours bike rides?", select_possible_answers: "Less than 10 miles,Around 20 miles,More than 20 miles", page: page_5, requiring_answer: "yes")



puts "database has questionnaires: #{Questionnaire.pluck(:name)}"


