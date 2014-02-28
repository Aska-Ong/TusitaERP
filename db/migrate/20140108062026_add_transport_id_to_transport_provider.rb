class AddTransportIdToTransportProvider < ActiveRecord::Migration
  def change
    add_column :transport_providers, :transport_id, :integer
  end
end
