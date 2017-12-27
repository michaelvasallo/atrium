class Company < ApplicationRecord
  has_many :developed_games,
           class_name: 'Game',
           foreign_key: :developer_id,
           dependent: :restrict_with_error

  has_many :published_games,
           class_name: 'Game',
           foreign_key: :publisher_id,
           dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true

  def games
    developed_games.or(published_games).distinct
  end
end
