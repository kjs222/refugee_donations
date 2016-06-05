class Family < ActiveRecord::Base
  has_many :supply_items, dependent: :destroy
  has_many :supplies, through: :supply_items


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :arrival_date, presence: true
  # validates :deadline, presence: true
  validates :nationality, presence: true
  validates :num_married_adults, presence: true
  validates :num_non_married_adults, presence: true
  validates :num_children_over_two, presence: true
  validates :num_children_under_two, presence: true

  def self.to_arrive
    Family.where('arrival_date > ?', DateTime.now)
  end


# <%= image_tag "rails.png" %>


  def num_people
    num_married_adults + num_non_married_adults + num_children_over_two + num_children_under_two
  end

  def num_twin_beds
    num_people - num_married_adults - num_children_under_two
  end

  def num_full_beds
    num_married_adults/2
  end

  def num_dressers
    num_people > 4 ? 4 : num_people
  end

  def num_couches
    num_people > 6 ? 2 : 1
  end


  def supply_item_hash
    {"Twin Bedframe" => num_twin_beds, "Twin Mattress" => num_twin_beds, "Full Bedframe" => num_full_beds, "Full Mattress" => num_full_beds, "Dresser" => num_dressers, "Couch" => num_couches, "Kitchen Table" => 1, "Kitchen Chair" => num_people, "Crib" => num_children_under_two, "Silverware Set" => num_people, "Large Pot" => 1, "Small Pot" => 1}
  end

  def create_supply_items
    supply_item_hash.each do |item_name, quantity|
      supply_items.create(supply: Supply.find_by(name: item_name), quantity: quantity)
    end

  end




end
