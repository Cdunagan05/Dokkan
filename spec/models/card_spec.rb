require 'rails_helper'

RSpec.describe Card, type: :model do
  it{should have_many(:users).through(:user_cards)}
end
