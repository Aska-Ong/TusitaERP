class Item < ActiveRecord::Base

	has_many :stocks, :dependent => :destroy
	attr_accessible :name

	validates :name, presence: true, uniqueness: {case_sensitive: false}

end
