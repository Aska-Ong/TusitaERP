class Renaming < ActiveRecord::Migration
  def change
  	rename_table :finance_records, :finances
  end
end
