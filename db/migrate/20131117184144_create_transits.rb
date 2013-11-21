class CreateTransits < ActiveRecord::Migration
  def change
    create_table :transits do |t|
      t.string :passenger_name
      t.date :date_departure
      t.date :date_arrival
      t.string :sector
      t.string :flight_no
      t.string :terminal

      t.timestamps
    end
  end
end
