class Roleedit < ActiveRecord::Migration
  def change
  	add_column :roles, :inventory, :boolean
  	add_column :roles, :event, :boolean
  	add_column :roles, :transit, :boolean
  	add_column :roles, :forum, :boolean
  end
end
