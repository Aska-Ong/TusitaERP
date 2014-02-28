class RemovetransportId < ActiveRecord::Migration
  def change
  	remove_column :transports, :transport_id
  end
end
