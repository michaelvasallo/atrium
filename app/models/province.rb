class Province < ApplicationRecord
  has_many :addresses, dependent: :restrict_with_error
  has_many :users, through: :addresses

  validates :name, :abbr, presence: true, uniqueness: true
end
