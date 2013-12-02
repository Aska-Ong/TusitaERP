class Finance < ActiveRecord::Base
	validates :amount, presence: true , numericality: {greater_than: 0}
	validates :date, presence: true
	validates :description, presence: true

	attr_accessible :amount,:date,:description
end
