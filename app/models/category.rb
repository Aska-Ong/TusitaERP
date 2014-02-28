class Category < ActiveRecord::Base
  
  # Associations
  has_many :forums, :dependent => :destroy
  has_many :categoryroles, :dependent => :destroy
  has_many :roles, :through => :categoryroles
  
  # Accessors
  attr_accessible :title, :state, :position, :category_id, :categoryrole_ids
  
  # Scopes
  default_scope :order => 'position ASC'
  
  # Validations
  validates :title,       :presence => true
end