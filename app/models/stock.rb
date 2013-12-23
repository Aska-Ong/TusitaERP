class Stock < ActiveRecord::Base
	belongs_to :item
	belongs_to :branch
	validates :count, presence: true
	validates :item_id, :uniqueness => {:scope => :branch_id}
	attr_accessible :count, :branch_id, :item_id
	

	def set_values(user_params)
       self.branch_id = user_params[:branch_id]
       self.id = user_params[:id]
       self.item_id = user_params[:item_id]
       self.count = user_params[:count]
    end
end
