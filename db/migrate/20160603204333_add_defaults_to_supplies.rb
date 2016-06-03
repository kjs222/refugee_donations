class AddDefaultsToSupplies < ActiveRecord::Migration
  def change
    change_column_default(:supplies, :required, true)
    change_column_default(:supplies, :new, false)

  end
end
