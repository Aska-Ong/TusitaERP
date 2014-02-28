class RemoveTransitRecords < ActiveRecord::Migration
  def change
  	drop_table :transit_records
  end
end
