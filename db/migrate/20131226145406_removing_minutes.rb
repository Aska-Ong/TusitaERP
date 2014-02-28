class RemovingMinutes < ActiveRecord::Migration
  def change
  	drop_table :minutes
  end
end
