class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.integer :signed_up
      t.integer :attended
      t.integer :total

      t.timestamps
    end
  end
end
