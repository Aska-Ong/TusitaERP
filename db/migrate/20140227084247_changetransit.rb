class Changetransit < ActiveRecord::Migration
  def change
  	remove_column :transits, :date_departure
  	remove_column :transits, :date_arrival
  	remove_column :transits, :sector
  	remove_column :transits, :terminal
  	remove_column :transits, :requiretransport
  	add_column :transits, :date, :date
  	add_column :transits, :time, :time
  	add_column :transits, :food, :boolean
  	add_column :transits, :transportation, :boolean
  	add_column :transits, :accommodation, :boolean
  end
end
