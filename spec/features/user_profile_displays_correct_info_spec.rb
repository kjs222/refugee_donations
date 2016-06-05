require 'rails_helper'

RSpec.feature "users profile is correct" do
  scenario "pledged item shows" do

    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01", nationality: "Syrian", num_married_adults: 2, num_non_married_adults: 1, num_children_over_two: 2, num_children_under_two: 1, deadline: "2016-06-23" )
    family.create_supply_items

    user = User.create(username: "test", password: "password", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit family_path(family)

    within(".Dresser") do
      click_on "Donate"
    end

    admin = User.create(username: "test", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( admin )

    visit admin_family_path(family)

    within(".Dresser") do
      select "Received", from: 'supply_item[status]'
      click_on("Update")
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit user_path(user)

    within(".donated") do
      expect(page).to have_content("Dresser")
    end
  end
end
