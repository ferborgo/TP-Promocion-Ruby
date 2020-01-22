# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genres = Genre.create([
    {name: 'Drama'},
    {name: 'Assay'},
    {name: 'Fantastic'}
])

authors = Author.create([
  {first_name: 'Jorge Luis', last_name: 'Borges'},
  {first_name: 'Ernest', last_name: 'Sábato'},
  {first_name: 'Gabriel', last_name: 'García Márquez'},
  {first_name: 'Ray', last_name: 'Bradbury'}
])

books = Book.create([
  {
    title: 'El libro de arena',
    author: Author.find_by(last_name: 'Borges'),
    genre: Genre.find_by(name: 'Fantastic'),
    pages: 145
  }
])
