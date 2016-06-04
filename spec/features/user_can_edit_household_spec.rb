require 'rails_helper'

RSpec.feature "Admin user gets to show page with edited information" do
  scenario "admin user see the page for the edited family" do

    admin = User.create(username: "Admin", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( admin )


    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01")
    edited_first_name = "Edited"

    visit families_path
    click_on("(Edit)")
    expect(current_path).to eq(edit_admin_family_path(family))
    fill_in 'family[first_name]', with: edited_first_name
    click_on("Update Family")
    expect(current_path).to eq(family_path(family))
    expect(page).to have_content("#{family.last_name}, #{edited_first_name}")
  end


  scenario "default user does not see edit option" do

    user = User.create(username: "default", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )


    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01")


    visit families_path
    expect(page).to_not have_content("Edit")
  end

  scenario "default user gets 404 on visit to edit" do

    user = User.create(username: "default", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )


    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01")


    visit edit_admin_family_path(family)
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
