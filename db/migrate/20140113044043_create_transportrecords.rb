class CreateTransportrecords < ActiveRecord::Migration
  def change
    create_table :transportrecords do |t|
      t.integer :transit_id
      t.integer :transport_id

      t.timestamps
    end
  end
end
