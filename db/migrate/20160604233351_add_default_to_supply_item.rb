class AddDefaultToSupplyItem < ActiveRecord::Migration
  def change
    change_column :supply_items, :status, :string, :default => "Needed"
  end
end
