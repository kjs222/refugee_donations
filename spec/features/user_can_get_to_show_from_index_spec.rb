require 'rails_helper'

RSpec.feature "User gets to show page from index" do
  scenario "they see the page for the individual family" do

    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01")
    visit families_path

    click_on "#{family[:last_name]}, #{family[:first_name]}"

    expect(current_path).to eq(family_path(family.id))
  end
end
