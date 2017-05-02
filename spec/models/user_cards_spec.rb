require 'rails_helper'

RSpec.describe UserCard, type: :model do
  it {should belong_to(:user)}
  it {should belong_to(:card)}
end
