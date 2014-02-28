class CreateCategoryroles < ActiveRecord::Migration
  def change
  	drop_table :categoryroles
  	
    create_table :categoryroles do |t|
      t.integer :category_id

      t.timestamps
    end
  end
end
