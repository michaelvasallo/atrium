class User < ApplicationRecord
  has_secure_password

  has_one :address, dependent: :destroy
  has_one :province, through: :address
  has_many :orders

  validates :username, :email, :first_name, :last_name, presence: true
  validates :username, :email, uniqueness: { message: 'already in use' }
  validates :username, format: {
    with: /\A[a-zA-Z0-9]+\Z/,
    message: 'must be alphanumeric'
  }
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    message: 'must be a valid email address'
  }
  validates :username, length: { minimum: 3 }
  validates :password, length: { in: 8..128 }, confirmation: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
