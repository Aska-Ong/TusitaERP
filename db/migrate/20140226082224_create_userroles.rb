class CreateUserroles < ActiveRecord::Migration
  def change
    create_table :userroles do |t|
      t.integer :role_id
      t.integer :user_id

      t.timestamps
    end
  end
end
