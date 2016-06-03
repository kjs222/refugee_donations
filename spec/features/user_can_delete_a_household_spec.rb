require 'rails_helper'

RSpec.feature "User can delete a family" do
  scenario "they see the index page" do

    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01")

    visit families_path
    expect(page).to have_content("Amir")

    visit family_path(family)

    click_on("Delete Family")
    expect(current_path).to eq(families_path)
    expect(page).to_not have_content("Amir")
  end
end
