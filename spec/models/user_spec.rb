require 'rails_helper'

RSpec.describe User, type: :model do
  it {is_expected.to validate_presence_of(:username)}
  it {is_expected.to validate_presence_of(:email)}
  it {is_expected.to validate_presence_of(:password)}

  it {is_expected.to validate_uniqueness_of(:email)}
  it {is_expected.to validate_uniqueness_of(:username)}

  it {should have_many(:cards).through(:user_cards)}
end
