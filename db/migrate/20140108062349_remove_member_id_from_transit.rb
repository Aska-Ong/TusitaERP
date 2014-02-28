class RemoveMemberIdFromTransit < ActiveRecord::Migration
  def change
  	remove_column :transits, :passenger_name
  end
end
