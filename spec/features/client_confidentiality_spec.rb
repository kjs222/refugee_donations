require 'rails_helper'

RSpec.feature "client confidentiality is maintained" do
  scenario "logged in default user does not see client names" do

    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01", nationality: "Syrian", num_married_adults: 2, num_non_married_adults: 1, num_children_over_two: 2, num_children_under_two: 1, deadline: "2016-06-23" )
    family.create_supply_items

    user = User.create(username: "test", password: "password", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit families_path
    expect(page).to_not have_content("Amir")
    expect(page).to_not have_content("Mohammed")
    expect(page).to_not have_content("Blake")

    visit family_path(family)
    expect(page).to_not have_content("Amir")
    expect(page).to_not have_content("Mohammed")
    expect(page).to_not have_content("Blake")
  end


  scenario "guest does not see client names" do
    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01", nationality: "Syrian", num_married_adults: 2, num_non_married_adults: 1, num_children_over_two: 2, num_children_under_two: 1, deadline: "2016-06-23" )
    family.create_supply_items

    visit families_path
    expect(page).to_not have_content("Amir")
    expect(page).to_not have_content("Mohammed")
    expect(page).to_not have_content("Blake")

    visit family_path(family)
    expect(page).to_not have_content("Amir")
    expect(page).to_not have_content("Mohammed")
    expect(page).to_not have_content("Blake")

  end


  scenario "admmin user sees client names" do

    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01", nationality: "Syrian", num_married_adults: 2, num_non_married_adults: 1, num_children_over_two: 2, num_children_under_two: 1, deadline: "2016-06-23" )
    family.create_supply_items

    user = User.create(username: "admin", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit families_path
    expect(page).to have_content("Amir")
    expect(page).to have_content("Mohammed")


    visit family_path(family)
    expect(page).to have_content("Amir")
    expect(page).to have_content("Mohammed")

  end

end
