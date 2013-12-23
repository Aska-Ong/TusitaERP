class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :count
      t.integer :branch_id
      t.integer :item_id

      t.timestamps
    end
  end
end
