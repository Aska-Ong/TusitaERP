class Cleanup < ActiveRecord::Migration
  def change
  	drop_table :accounts
  	drop_table :transactions
  end
end
