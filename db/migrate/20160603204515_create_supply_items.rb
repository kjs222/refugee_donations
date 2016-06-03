class CreateSupplyItems < ActiveRecord::Migration
  def change
    create_table :supply_items do |t|
      t.references :family, index: true, foreign_key: true
      t.references :supply, index: true, foreign_key: true
      t.integer :quantity
      t.string :status
    end
  end
end
