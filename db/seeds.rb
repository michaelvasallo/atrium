# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@atrium.games', password: 'F8mg%@r4Hrwv104d', password_confirmation: 'F8mg%@r4Hrwv104d') if Rails.env.development?

require 'csv'
require 'date'

def parse_csv file
  csv_text = File.read(Rails.root.join('lib', 'seeds', file))
  CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
end

parse_csv('genres.csv').each do |row|
  Genre.create!(name: row['name'])
end

parse_csv('companies.csv').each do |row|
  Company.create!(name: row['name'])
end

parse_csv('games.csv').each do |row|
  Game.create!(
    title: row['title'],
    description: row['description'],
    price: row['price'],
    release_date: Date.parse(row['release_date']),
    developer: Company.find_by(name: row['developer']),
    publisher: Company.find_by(name: row['publisher'])
  )
end

parse_csv('game_genres.csv').each do |row|
  GameGenre.create!(
    game: Game.find_by(title: row['game']),
    genre: Genre.find_by(name: row['genre'])
  )
end
