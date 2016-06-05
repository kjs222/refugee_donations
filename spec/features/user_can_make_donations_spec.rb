require 'rails_helper'

RSpec.feature "users can make donations" do
  scenario "logged in default user can make donations" do

    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01", nationality: "Syrian", num_married_adults: 2, num_non_married_adults: 1, num_children_over_two: 2, num_children_under_two: 1, deadline: "2016-06-23" )
    family.create_supply_items

    user = User.create(username: "test", password: "password", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit family_path(family)

    within(".Dresser") do
      click_on "Donate"
    end
    expect(page).to have_content("Donation saved"
    )
    within(".Dresser") do
      expect(page).to have_content("Pledged by: #{user.username}")
    end

    visit user_path(user)
    expect(page).to have_content("Dresser"
    )


  end

  scenario "guest user cannot make donation without login" do
    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01", nationality: "Syrian", num_married_adults: 2, num_non_married_adults: 1, num_children_over_two: 2, num_children_under_two: 1, deadline: "2016-06-23" )
    family.create_supply_items

    visit family_path(family)

    within(".Dresser") do
      expect(page).to_not have_button("Donate")
      expect(page).to have_link("Login to Donate")
      click_on("Login to Donate")
    end

    expect(current_path).to eq(login_path)

  end

  scenario "admin can change status of donation" do

    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01", nationality: "Syrian", num_married_adults: 2, num_non_married_adults: 1, num_children_over_two: 2, num_children_under_two: 1, deadline: "2016-06-23" )
    family.create_supply_items

    admin = User.create(username: "admin", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( admin )

    visit admin_family_path(family)
    within(".Dresser") do
      select "Received", from: 'supply_item[status]'
      fill_in 'supply_item[quantity]', with: 10
      click_on("Update")
    end

    expect(page).to have_content("Supply item updated successfully")

    visit family_path(family)
    within(".Dresser") do
      expect(page).to have_content('10')
      expect(page).to have_content("Received")
    end
  end

end
