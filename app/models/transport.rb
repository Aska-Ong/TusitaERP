class Transport < ActiveRecord::Base
	has_many :transportrecords
	has_many :transits, :through => :transportrecords

	validates :name, presence: true
	validates :email, presence: true
	validates :contact_number, presence: true

	attr_accessible :name,:email,:contact_number
end
