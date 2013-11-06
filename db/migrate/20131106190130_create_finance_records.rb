class CreateFinanceRecords < ActiveRecord::Migration
  def change
    create_table :finance_records do |t|
      t.string :type
      t.decimal :amount
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
