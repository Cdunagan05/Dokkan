require 'rails_helper'

RSpec.describe 'As a guest' do
  context 'when I visit the site' do
    it 'I can sign up for an account' do
      visit root_path

      expect(page).to have_css("#signup", :visible => "Create an Account!")

      click_on "Create an Account!"

      expect(current_path).to eq(signup_path)

      fill_in "user_username", with: "Cdun"
      fill_in "user_email", with: "cdun@utexas.edu"
      fill_in "user_password", with: "texas"
      fill_in "user_password_confirmation", with: "texas"

      click_on "Create User"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome to Dokkan, Cdun!")
    end

    it "cannot sign in if email is already taken" do
      User.create(username: "cdunagan", email: "texas@gmail.com", password: "texas")
      visit root_path

      click_on "Create an Account!"

      fill_in "user_username", with: "Myname"
      fill_in "user_email", with: "texas@gmail.com"
      fill_in "user_password", with: "texas"
      fill_in "user_password_confirmation", with: "texas"

      expect(current_path).to eq(signup_path)
      expect(page).to have_content("some sort of error")


    end
  end
end
