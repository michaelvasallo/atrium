class Address < ApplicationRecord
  belongs_to :province
  belongs_to :user

  validates :line_1, :city, :postal_code, :province_id, :user_id, presence: true
end
