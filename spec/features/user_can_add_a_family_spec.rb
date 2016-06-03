require 'rails_helper'

RSpec.feature "User enters a new family" do

  scenario "they see the page for the individual family" do

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

    visit families_path
    click_on "Add new family"
    expect(current_path).to eq(new_family_path)

    fill_in 'family[first_name]', with: first_name
    fill_in 'family[last_name]', with: last_name
    fill_in 'family[address]', with: address
    fill_in 'family[arrival_date]', with: arrival_date
    fill_in 'family[nationality]', with: nationality
    fill_in 'family[description]', with: description

    select num_married_adults.to_s, from: "family[num_married_adults]"
    select num_non_married_adults.to_s, from: "family[num_non_married_adults]"
    select num_children_under_two.to_s, from: "family[num_children_under_two]"
    select num_children_over_two.to_s, from: "family[num_children_over_two]"


    find(:button, "Create Family").click

    expect(current_path).to eq(family_path(Family.last))

    expect(page).to have_content("#{last_name}, #{first_name}")
    expect(page).to have_content("#{arrival_date}")
    expect(page).to have_content("#{address}")
    expect(page).to have_content("Married Adults: #{num_married_adults}")
    expect(page).to have_content("Unmarried Adults: #{num_non_married_adults}")

  end


end
