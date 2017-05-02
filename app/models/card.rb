class Card < ApplicationRecord
  has_many :user_cards
  has_many :users, through: :user_cards

  enum rarity: [:average, :good, :elite, :hall_of_famer]
  enum special: [:break_tackle, :perfect_pass, :amazing_catch, :huge_hit]
end
