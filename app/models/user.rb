class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates_confirmation_of :password
  has_secure_password

  has_many :user_cards
  has_many :cards, through: :user_cards

  def buys_card
    new_card = Card.random_card
    update_dollars
    if dollars > (-1)
      cards << new_card
    else
      false
    end
  end

  def update_dollars
    dollars_left = dollars - 50
    update(dollars: dollars_left)
  end
end
