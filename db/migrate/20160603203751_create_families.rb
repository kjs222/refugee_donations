class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|

      t.string :first_name
      t.string :last_name
      t.datetime :arrival_date
      t.string :address
      t.string :nationality
      t.integer :num_married_adults
      t.integer :num_non_married_adults
      t.integer :num_children_over_two
      t.integer :num_children_under_two
      t.text :description
      t.datetime :deadline

      t.timestamps null: false
    end
  end
end
