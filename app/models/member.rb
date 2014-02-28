class Member < ActiveRecord::Base
	has_many :transitrecords
	has_many :transit, :through => :transitrecords
	attr_accessible :name,:email,:contact_number
end
