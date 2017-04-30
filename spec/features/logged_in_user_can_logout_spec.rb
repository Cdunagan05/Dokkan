require 'rails_helper'

RSpec.describe "Logged in user can logout" do
  context "When a logged in user tries to logout" do
    it "the user can logout" do
      stub_logged_in_user

      click_on "Logout"

      expect(current_path).to eq(root_path)
      expect(page).to have_css("#signup", :visible => "Create an Account!")
    end
  end
end
