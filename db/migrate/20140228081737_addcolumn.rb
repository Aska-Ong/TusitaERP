class Addcolumn < ActiveRecord::Migration
  def change
  	add_column :categoryroles, :role_id, :integer
  	remove_column :users, :role
  end
end
