class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :name
      t.boolean :required
      t.boolean :new
    end
  end
end
