class Game < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :developer, class_name: 'Company', foreign_key: :developer_id
  belongs_to :publisher, class_name: 'Company', foreign_key: :publisher_id

  has_many :game_genres, dependent: :destroy
  has_many :genres, through: :game_genres

  validates :title, :price, :release_date, :image, :video, :developer, :publisher, presence: true
  validates :title, uniqueness: true

  mount_uploader :image, ImageUploader

  scope :genre, ->(genre) { joins(:genres).where 'genres.slug = ?', genre }
  scope :discount_over, ->(discount) { where 'discount > ?', discount.to_f / 100 }
  scope :months_ago, ->(months) { where 'release_date >= ?', months.to_i.months.ago }
  scope :query, ->(term) { where 'title LIKE ?', "%#{term}%" }
  scope :order_by, ->(type) do
    case type
    when 'title'
      reorder :title
    when 'release_asc'
      reorder release_date: :asc
    when 'release_desc'
      reorder release_date: :desc
    end
  end

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
