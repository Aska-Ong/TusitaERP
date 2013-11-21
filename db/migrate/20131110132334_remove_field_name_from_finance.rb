class RemoveFieldNameFromFinance < ActiveRecord::Migration
  def change
    remove_column :finances, :type, :string
  end
end
