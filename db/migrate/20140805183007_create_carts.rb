class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :total, :precision => 8, :scale => 2
      t.timestamps null: false
    end
  end
end
