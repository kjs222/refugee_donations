require 'rails_helper'

RSpec.feature "Admin user enters a new family" do

  scenario "admin user adds and sees the page for the individual family" do

    first_name = "Amir"
    last_name = "Mohammed"
    address = "1510 Blake St, Denver, CO 80202"
    arrival_date = "2016-07-01"
    nationality = "Syrian"
    description  = "This family fled Syrian in 2012."
    num_married_adults = 2
    num_non_married_adults = 0
    num_children_under_two = 2
    num_children_over_two = 1
    deadline = "2016-06-23"

    admin = User.create(username: "Admin", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( admin )

    visit families_path
    click_on "Add a new family" #only there if admin user
    expect(current_path).to eq(new_admin_family_path)

    fill_in 'family[first_name]', with: first_name
    fill_in 'family[last_name]', with: last_name
    fill_in 'family[address]', with: address
    fill_in 'family[arrival_date]', with: arrival_date
    fill_in 'family[deadline]', with: deadline
    fill_in 'family[description]', with: description

    select nationality, from: 'family[nationality]'
    select num_married_adults, from: "family[num_married_adults]"
    select num_non_married_adults, from: "family[num_non_married_adults]"
    select num_children_over_two, from: "family[num_children_over_two]"
    select  num_children_under_two, from: "family[num_children_under_two]"


    find(:button, "Create Family").click

    expect(current_path).to eq(admin_family_path(Family.last))


    expect(page).to have_content("#{last_name}, #{first_name}")
    expect(page).to have_content("#{arrival_date}")
    expect(page).to have_content("Married Adults: #{num_married_adults}")
    expect(page).to have_content("Unmarried Adults: #{num_non_married_adults}")

  end

  scenario "default user gets 404 on visit to new family" do

    user = User.create(username: "default", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit new_admin_family_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end


end
