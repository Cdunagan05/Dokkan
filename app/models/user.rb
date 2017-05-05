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
    if update_dollars
      cards << new_card
    end
  end

  def update_dollars
    dollars_left = dollars - 50
    if dollars_left > (-1)
      update(dollars: dollars_left)
    else
      false
    end
  end
end
