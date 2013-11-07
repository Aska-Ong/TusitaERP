class Finance < ActiveRecord::Base
	self.inheritance_column = nil
	validates :type,  presence: true, length: { maximum: 8 }
	validates :amount, presence: true , numericality: true
	validates :date, presence: true
	validates :description, presence: true
end
