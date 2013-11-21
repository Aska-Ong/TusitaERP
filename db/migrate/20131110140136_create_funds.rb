class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.string :type
      t.decimal :amount

      t.timestamps
    end
  end
end
