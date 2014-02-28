class Transportrecord < ActiveRecord::Base
	belongs_to :transport
	belongs_to :transit
end
