class Transport < ActiveRecord::Base
	validates :transit_id, presence: true
	validates :name, presence: true

	attr_accessible :transit_id, :name
end
