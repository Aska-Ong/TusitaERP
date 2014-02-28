class Dropfinances < ActiveRecord::Migration
  def change
  	drop_table :finances
  	drop_table :funds
  end
end
