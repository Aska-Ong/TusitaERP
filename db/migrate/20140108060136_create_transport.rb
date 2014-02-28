class CreateTransporttemp < ActiveRecord::Migration
  def change
    create_table :transports do |t|
      t.string :name
      t.string :email
      t.integer :contact_number

      t.timestamps
    end
  end
end
