class DeleteTransports < ActiveRecord::Migration
  def change
  	drop_table :transports
  end
end
