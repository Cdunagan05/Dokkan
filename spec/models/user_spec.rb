require 'rails_helper'

RSpec.describe User, type: :model do
  it {is_expected.to validate_presence_of(:username)}
  it {is_expected.to validate_presence_of(:email)}
  it {is_expected.to validate_presence_of(:password)}

  it {is_expected.to validate_uniqueness_of(:email)}
  it {is_expected.to validate_uniqueness_of(:username)}

  it {should have_many(:cards).through(:user_cards)}

  it "adds a card to a user" do
    user = User.create(username: "Tex", email: "tex@gmail.com", password: "tex")
    Card.create(player: "Emmitt Smith")

    user.buys_card

    expect(user.cards.count).to eq(1)
    expect(user.cards.first.player).to eq("Emmitt Smith")
  end

  it "subtracts money when user buys card" do
    user = User.create(username: "Tex", email: "tex@gmail.com", password: "tex")
    Card.create(player: "Emmitt Smith")

    user.buys_card

    expect(user.dollars).to eq(150)
  end

  it "cannot buy card if user does not have enough money" do
    user = User.create(username: "Tex", email: "tex@gmail.com", password: "tex", dollars: 20)
    Card.create(player: "Emmitt Smith")

    user.buys_card

    expect(user.cards.count).to eq(0)
    expect(user.dollars).to eq(20)
  end
end
