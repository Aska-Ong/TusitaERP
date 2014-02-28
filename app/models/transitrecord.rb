class Transitrecord < ActiveRecord::Base
	belongs_to :transit 
	belongs_to :member
end
