class Game < ApplicationRecord
  belongs_to :developer, :class_name => "Company", :foreign_key => :developer_id
  belongs_to :publisher, :class_name => "Company", :foreign_key => :publisher_id
  has_many :game_genres
  has_many :genres, through: :game_genres
end
