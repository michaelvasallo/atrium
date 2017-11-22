class User < ApplicationRecord
  has_secure_password

  has_one :address
  has_one :province, through: :address

  accepts_nested_attributes_for :address

  valid_email = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :username, :email, :first_name, :last_name, presence: true
  validates :username, :email, uniqueness: { message: 'already in use' }
  validates :email, format: { with: valid_email, message: 'must be a valid email address' }
  validates :password, length: { in: 8..128 }, confirmation: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
