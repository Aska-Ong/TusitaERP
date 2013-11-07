class Finance < ActiveRecord::Base
	validates :type,  presence: true, length: { maximum: 8 }
	validates :amount, presence: true
	validates :date, presence: true
	validates :description, presence: true
end
