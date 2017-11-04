class Game < ApplicationRecord
  belongs_to :developer, class_name: 'Company', foreign_key: :developer_id
  belongs_to :publisher, class_name: 'Company', foreign_key: :publisher_id

  has_many :game_genres, dependent: :destroy
  has_many :genres, through: :game_genres

  validates :title, :description, :price, :release_date, :image, :video, presence: true

  mount_uploader :image, ImageUploader

  def on_sale?
    discount.present?
  end

  def sale_price
    on_sale? ? (price - price * discount).round(2) : price
  end

  def print_genres
    genres.pluck(:name).join(', ')
  end
end
