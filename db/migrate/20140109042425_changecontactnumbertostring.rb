class Changecontactnumbertostring < ActiveRecord::Migration
  def change
  	change_column :transports, :contact_number, :string
  	change_column :members, :contact_number, :string
  end
end
