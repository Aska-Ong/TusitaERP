class Subtype < ActiveRecord::Migration
  def change
  	add_column :accounts, :subtype, :string 
  end
end
