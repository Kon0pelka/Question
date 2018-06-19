# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create!(name: "fool")
Category.create!(name: "asdf")
Category.create!(name: "c")
Category.create!(name: "rails")

User.create!(nick:  "Example User",
             email: "example@railstutorial.org",
             password: "foobar",
             admin: true)
10.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(nick: name,
                email: email,
                password:             password)
end

user = User.first
5.times do |n|
    title = Faker::Lorem.sentence(3)
    info = Faker::Lorem.sentences(6)
    user.questions.create!(title: title,
                           info: info)
                           #debugger
    quest = Question.find(n+1).id
    category = Category.first.id
    QuestionsCategory.create!(question_id: quest, category_id: category)
end
questions = Question.all
5.times do |n|
    info = Faker::Lorem.sentences(6)
    questions.each { |question| question.answers.create!(info: info,
                        autor_id: n+1) }
end

