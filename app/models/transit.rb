class Transit < ActiveRecord::Base
	has_many :transitrecords, :dependent => :destroy
	has_many :members, :through => :transitrecords
	has_many :transportrecords, :dependent => :destroy
	has_many :transports, :through => :transportrecords

	validates :member_ids, presence: true
	validates :date, presence: true
	validates :time, presence: true
	validates :flight_no, presence: true

	attr_accessible :date,:time,:food,:flight_no,:transportation,:status,:accommodation,:member_ids,:transport_ids
end
