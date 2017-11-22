class Province < ApplicationRecord
  has_many :addresses
  has_many :users, through: :addresses

  validates :name, :abbr, presence: true, uniqueness: true
end
