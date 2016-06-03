require 'rails_helper'

RSpec.feature "guest can create account", type: :feature do

  scenario "create_account" do
    visit new_user_path
    fill_in "Username", with: "Kerry"
    fill_in "Password", with: "password"
    click_button "Create Account"

    expect(current_path).to eq(families_path)
    click_link "Login"
    fill_in 'session[username]', with: "Kerry"
    fill_in 'session[password]', with: "password"
    click_button "Login"
    expect(page).to have_content("Welcome, Kerry")

  end
end
