class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates_confirmation_of :password
  has_secure_password

  has_many :user_cards
  has_many :cards, through: :user_cards
end
