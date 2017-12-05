# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(
  email: 'admin@atrium.com',
  password: 'password',
  password_confirmation: 'password'
) if Rails.env.development?

require 'csv'
require 'date'

def parse_csv file
  csv_text = File.read(Rails.root.join('lib', 'seeds', "#{file}.csv"))
  CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
end

parse_csv('genres').each do |row|
  Genre.create!(name: row['name'])
end

parse_csv('companies').each do |row|
  Company.create!(name: row['name'])
end

parse_csv('games').each do |row|
  Game.create!(
    title: row['title'],
    description: row['description'],
    price: row['price'],
    discount: row['discount'],
    release_date: Date.parse(row['release_date']),
    image: Rails.root.join("public/uploads/game/image/#{row['image']}").open,
    video: row['video'],
    developer: Company.find_by(name: row['developer']),
    publisher: Company.find_by(name: row['publisher'])
  )
end

parse_csv('game_genres').each do |row|
  GameGenre.create!(
    game: Game.find_by(title: row['game']),
    genre: Genre.find_by(name: row['genre'])
  )
end

parse_csv('provinces').each do |row|
  Province.create!(
    name: row['name'],
    abbr: row['abbr'],
    pst: row['pst'],
    gst: row['gst'],
    hst: row['hst']
  )
end
