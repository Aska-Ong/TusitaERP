class Expense < ActiveRecord::Base
	belongs_to :fund
	validates :amount, presence: true , numericality: {greater_than: 0}
	validates :date, presence: true
	validates :description, presence: true
	validates :fund_id, presence: true
	validate :value_of_amount_on_update, on: :update
	validate :value_of_amount_on_create, on: :create

	def value_of_amount_on_update
		balance = Fund.where(:id => self.fund_id).sum(:amount) - Expense.where(:fund_id => self.fund_id).sum(:amount)
		allow_amount = Expense.find(self.id).amount + balance
	  if(!self.amount.blank?)
      if (self.amount + Expense.where(:fund_id => self.fund_id).sum(:amount) - Expense.find(self.id).amount) > Fund.where(:id => self.fund_id).sum(:amount)
		errors.add(:amount, "Insufficient balance: " + balance.to_s)
		errors.add(:amount, "Maximum allowed amount: " + allow_amount.to_s)
	  end
	  else
	  	errors.add(:amount, "can't be blank and must be numbers")
	  end
    end

    def value_of_amount_on_create
    	balance = Fund.where(:id => self.fund_id).sum(:amount) - Expense.where(:fund_id => self.fund_id).sum(:amount)
      if(!self.amount.blank?)
      if (self.amount > (balance))
		errors.add(:amount, "amount exceeded balance amount of " + balance.to_s)
	  end
	  else
	  	errors.add(:amount, "can't be blank and must be numbers")
	  end
    end

	def set_values(params)
       self.amount = params[:amount]
       self.id = params[:id]
       self.fund_id = params[:where_action]
    end

    def set_values(user_params)
    	self.amount = user_params[:amount]
    	self.id = user_params[:id]
    end
end
