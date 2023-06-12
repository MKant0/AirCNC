# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "destroying seeds"
User.destroy_all
Chair.destroy_all
Booking.destroy_all

puts "seeds destroyed"

puts "creating users"

user = User.new(email: "hola@hola.com", password: "123456")
user.save!

user1 = User.new(email: "hola1@hola.com", password: "123456")
user1.save!

puts "creating chairs"
file = URI.open("https://images.unsplash.com/photo-1581539250439-c96689b516dd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=765&q=80")
chair = Chair.new(name: "Tall Chair", address: "Scalabrini Ortiz 582, Buenos Aires, Argentina", rating: "4", description: "buena silla", price: "200", user: user)
chair.photos.attach(io: file, filename: "silla1.png", content_type: "image/png")
chair.save!

file = URI.open("https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80")
chair1 = Chair.new(name: "White Chair", address: "Av Libertador 23, Buenos Aires, Argentina", rating: "2", description: "super linda la silla", price: "400", user: user)
chair1.photos.attach(io: file, filename: "silla11.png", content_type: "image/png")
chair1.save!

file = URI.open("https://images.unsplash.com/photo-1562113530-57ba467cea38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=699&q=80")
chair2 = Chair.new(name: "Silla de Campo", address: "Calle Santa Maria 5, Cherquenco, Chile", rating: "4", description: "una silla perfecta para el campo", price: "100", user: user)
chair2.photos.attach(io: file, filename: "silla2.png", content_type: "image/png")
chair2.save!

file = URI.open("https://images.unsplash.com/photo-1580480055273-228ff5388ef8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80")
chair3 = Chair.new(name: "Silla Hermosa en Santiago", address: "Pasaje Los Gladiolos 6320, Santiago, Chile", rating: "5", description: "Esta silla es super comoda", price: "500", user: user)
chair3.photos.attach(io: file, filename: "silla3.png", content_type: "image/png")
chair3.save!

puts "creating bookings"
booking = Booking.new(date_start: "2023-06-10", date_end: "2023-06-21", chair: chair, user: user)
booking.save!

booking1 = Booking.new(date_start: "2023-06-15", date_end: "2023-06-23", chair: chair, user: user)
booking1.save!

puts "done!"
