# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Topic.create(
    title: Faker::Games::Heroes.specialty
  )
end

10.times do 
  Blog.create(
    title: Faker::TvShows::Seinfeld.character,
    body: Faker::Hipster.paragraph,
    topic_id: Faker::Number.between(from: 1, to: 3),
    status: Faker::Number.between(from: 0, to: 1)
  )
end

3.times do
  Topic.create(
    title: Faker::Games::Heroes.specialty
  )
end

5.times do
  Skill.create(
    title: Faker::Games::Heroes.specialty,
    percent_utilized: Faker::Number.decimal_part(digits: 2)
  )
end

5.times do
  Portfolio.create(
    title: Faker::Movies::StarWars.character,
    subtitle: Faker::Movies::StarWars.specie,
    body: Faker::Movies::StarWars.quote,
    position: Faker::Number.between(from: 1, to: 10),
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x200"
  )
end

6.times do
  Technology.create(
    name: Faker::ProgrammingLanguage.name,
    portfolio_id: Faker::Number.between(from: 1, to: 3)
  )
end