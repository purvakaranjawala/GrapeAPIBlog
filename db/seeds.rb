# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Flow.destroy_all
Book.destroy_all

15.times do
  Book.create!(isbn: Faker::Number.number(digits: 4), title: Faker::Superhero.power, stock: Faker::Number.between(from: 2,to: 20))
end
puts '15 books created'
 book_ids = Book.ids

95.times do
  Flow.create!(book_id: book_ids.sample, newStock: Faker::Number.between(from: 2,to: 20),
               previousStock: Faker::Number.between(from: 2,to: 20))
end
puts '15 books flow created'
