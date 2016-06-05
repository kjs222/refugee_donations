require 'rails_helper'

RSpec.feature "users can log in log out", type: :feature do

  scenario "login with valid credentials" do
    user= User.create(username: "Kerry", password: "password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(families_path)
    expect(page).to have_content("Welcome, Kerry")
    expect(page).to have_content("Profile")
  end

  scenario "failed login with invalid credentials" do
    user= User.create(username: "Kerry", password: "password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "P@ssword"
    click_button "Login"

    expect(current_path).to eq(login_path)
    expect(page).to_not have_content("Welcome, Kerry")
  end

  scenario "logged in user can log out" do
    user= User.create(username: "Kerry", password: "password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
    expect(current_path).to eq(families_path)
    click_link "Logout"
    expect(current_path).to eq(login_path)
    expect(page).to_not have_content("Welcome, Kerry")

  end
end
