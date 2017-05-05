require 'rails_helper'

RSpec.describe "When I go to buy cards" do
  context "and I click the buy cards button" do
    it "I spend money and add cards to my account" do
      stub_logged_in_user
      Card.create(player: "Emmitt Smith", rarity: 3, offense: 92, defense: 30, special: 0, position: "RB")

      click_on "Buy Card"

      expect(current_path).to eq(user_show_path)
      expect(User.all.first.cards.player).to eq("Emmitt Smith")
    end
  end
end
