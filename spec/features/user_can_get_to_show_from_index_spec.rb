require 'rails_helper'

RSpec.feature "User gets to show page from index" do
  scenario "they see the page for the individual family" do

    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01", nationality: "Syrian", num_married_adults: 2, num_non_married_adults: 1, num_children_over_two: 2, num_children_under_two: 1, deadline: "2016-06-23" )
    family.create_supply_items
    visit families_path

    click_on "#{family.nationality} family of #{family.num_people}"

    expect(current_path).to eq(family_path(family.id))
  end
end
