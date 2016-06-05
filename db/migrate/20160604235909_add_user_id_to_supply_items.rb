class AddUserIdToSupplyItems < ActiveRecord::Migration
  def change
    add_reference :supply_items, :user, index: true, foreign_key: true
  end
end
