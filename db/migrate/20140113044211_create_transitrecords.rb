class CreateTransitrecords < ActiveRecord::Migration
  def change
    create_table :transitrecords do |t|
      t.integer :transit_id
      t.integer :member_id

      t.timestamps
    end
  end
end
