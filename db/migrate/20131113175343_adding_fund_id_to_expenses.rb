class AddingFundIdToExpenses < ActiveRecord::Migration
  def change
  	add_column :expenses, :fund_id, :integer
  end
end
