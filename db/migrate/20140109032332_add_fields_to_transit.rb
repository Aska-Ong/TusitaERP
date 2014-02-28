class AddFieldsToTransit < ActiveRecord::Migration
  def change
  	add_column :transits, :status, :boolean
  	add_column :transits, :requiretransport, :boolean
  end
end
