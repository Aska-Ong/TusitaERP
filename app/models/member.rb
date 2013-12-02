class Member < ActiveRecord::Base
	belongs_to :transit

	attr_accessible :name,:email,:contact_number
end
