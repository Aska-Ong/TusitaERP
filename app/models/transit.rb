class Transit < ActiveRecord::Base
	has_many :members
	validates :passenger_name, presence: true
	validates :date_departure, presence: true
	validates :date_arrival, presence: true
	validates :sector, presence: true
	validates :flight_no, presence: true
	validates :terminal, presence: true

	attr_accessible :passenger_name,:date_departure,:date_arrival,:sector,:flight_no,:terminal
end
