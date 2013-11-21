class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :type
      t.decimal :amount
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
