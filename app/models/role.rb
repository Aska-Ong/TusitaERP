class Role < ActiveRecord::Base
	has_many :userroles, :dependent => :destroy
  	has_many :users, :through => :userroles
  	has_many :categoryroles, :dependent => :destroy
  	has_many :categories, :through => :categoryroles
	validates :name, :presence => true
	attr_accessible :name,:inventory,:event,:transit,:forum
end
