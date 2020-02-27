# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  {email: 'admin@admin.com', password:'password', password_confirmation: 'password', is_admin: true, first_name: 'Admin', last_name: 'Admin', username: 'Admin'},
  {email: 'example@gmail.com', password:'password', password_confirmation: 'password', is_admin: false, first_name: 'Juan', last_name: 'Pérez', username: 'juanperez'}
])

genres = Genre.create([
    {name: 'Drama'},
    {name: 'Assay'},
    {name: 'Fantastic'},
    {name: 'Novel'},
    {name: 'Literatura Contemporánea'}
])

authors = Author.create([
  {first_name: 'Jorge Luis', last_name: 'Borges'},
  {first_name: 'Ernesto', last_name: 'Sábato'},
  {first_name: 'Gabriel', last_name: 'García Márquez'},
  {first_name: 'Ray', last_name: 'Bradbury'},
  {first_name: 'Julio', last_name: 'Cortázar'}
])

books = Book.create([
  {
    title: 'El libro de arena',
    author: Author.find_by(last_name: 'Borges'),
    genre: Genre.find_by(name: 'Fantastic'),
    pages: 145
  },
  {
    title: 'Fahrenheit 451',
    author: Author.find_by(last_name: 'Bradbury'),
    genre: Genre.find_by(name: 'Fantastic'),
    pages: 350
  },
  {
    title: 'El túnel',
    author: Author.find_by(last_name: 'Sábato'),
    genre: Genre.find_by(name: 'Literatura Contemporánea'),
    pages: 240
  },
  {
    title: 'Sobre héroes y tumbas',
    author: Author.find_by(last_name: 'Sábato'),
    genre: Genre.find_by(name: 'Literatura Contemporánea'),
    pages: 540
  },
  {
    title: 'Los funerales de Mamá Grande',
    author: Author.find_by(last_name: 'García Márquez'),
    genre: Genre.find_by(name: 'Fantastic'),
    pages: 240
  },
  {
    title: 'Rayuela',
    author: Author.find_by(last_name: 'Cortázar'),
    genre: Genre.find_by(name: 'Novel'),
    pages: 690
  },
  {
    title: '62 Modelo para Armar',
    author: Author.find_by(last_name: 'Cortázar'),
    genre: Genre.find_by(name: 'Novel'),
    pages: 490
  },
  {
    title: 'Libro de Manuel',
    author: Author.find_by(last_name: 'Cortázar'),
    genre: Genre.find_by(name: 'Novel'),
    pages: 500
  }
])
