require 'rails_helper'

RSpec.describe Card, type: :model do
  it{should have_many(:users).through(:user_cards)}

  it "Chooses a random card" do
    Card.create(player: "John Elway")
    Card.create(player: "Barry Sanders")

    card = Card.random_card

    expect(card.player).to be_in(["Barry Sanders", "John Elway"])
  end
end
