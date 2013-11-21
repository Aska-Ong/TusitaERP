class CreateTransports < ActiveRecord::Migration
  def change
    create_table :transports do |t|
      t.integer :transit_id
      t.string :name

      t.timestamps
    end
  end
end
