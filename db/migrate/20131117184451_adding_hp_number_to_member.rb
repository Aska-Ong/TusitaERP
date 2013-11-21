class AddingHpNumberToMember < ActiveRecord::Migration
  def change
  	add_column :members, :contact_number, :integer
  end
end
