require 'rails_helper'

RSpec.feature "User gets to show page with edited information" do
  scenario "they see the page for the edited family" do


    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01")
    edited_first_name = "Edited"

    visit families_path
    click_on("(Edit)")
    expect(current_path).to eq(edit_family_path(family))
    fill_in 'family[first_name]', with: edited_first_name
    click_on("Update Family")
    expect(current_path).to eq(family_path(family))
    expect(page).to have_content("#{family.last_name}, #{edited_first_name}")
  end
end
