class AddDefaultInventoryValueToItems < ActiveRecord::Migration
  def change
    change_column :items, :inventory, :integer, :default => 0
  end
end
