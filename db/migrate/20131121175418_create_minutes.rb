class CreateMinutes < ActiveRecord::Migration
  def change
    create_table :minutes do |t|
      t.string :content
      t.date :date
      t.string :name

      t.timestamps
    end
  end
end
