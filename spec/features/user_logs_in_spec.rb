require 'rails_helper'

RSpec.describe "When a user visits the site" do
  context "The user tries to log in" do
    it "logs in successfully" do
      User.create(username: "mouse", email: "mouse@gmail.com", password: "colorado")

      visit root_path
      click_on "Login"

      expect(current_path).to eq(login_path)

      fill_in "username", with: "mouse"
      fill_in "email", with: "mouse@gmail.com"
      fill_in "password", with: "colorado"

      click_on "Login"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome to Dokkan, mouse")
    end
  end
end
