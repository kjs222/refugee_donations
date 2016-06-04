require 'rails_helper'


RSpec.describe Family, "associations", type: :model do
  it { should have_many(:supply_items) }


  it "returns correct number of people" do
    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01", nationality: "Syrian", num_married_adults: 2, num_non_married_adults: 1, num_children_over_two: 2, num_children_under_two: 1)

    expect(family.num_people).to eq(6)
  end

  it "it can creates supply items" do
    family = Family.create(first_name: "Amir", last_name: "Mohammed", address: "1510 Blake Street, Denver, CO, 80205", arrival_date: "2016-07-01", nationality: "Syrian", num_married_adults: 2, num_non_married_adults: 1, num_children_over_two: 2, num_children_under_two: 1, deadline: "2016-06-23" )
    family.create_supply_items

    expect(family.supply_items.count).to eq(12)
    expect(family.supplies.count).to eq(12)

  end


end
