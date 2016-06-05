require 'rails_helper'

RSpec.feature "index has future families only" do
  scenario "only future families when past and future prepsent" do

    family1 = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2014-07-01", nationality: "Syrian", num_married_adults: 2, num_non_married_adults: 1, num_children_over_two: 2, num_children_under_two: 1, deadline: "2016-06-23" )

    family2 = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2018-07-01", nationality: "Iraq", num_married_adults: 0, num_non_married_adults: 1, num_children_over_two: 0, num_children_under_two: 0, deadline: "2016-06-23" )

    visit families_path
    expect(page).to_not have_content("Syrian")
    expect(page).to have_content("Iraq family of 1")
  end
end
