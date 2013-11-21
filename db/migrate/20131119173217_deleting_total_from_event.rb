class DeletingTotalFromEvent < ActiveRecord::Migration
  def change
  	remove_column :events, :total
  end
end
