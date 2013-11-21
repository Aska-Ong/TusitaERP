class Fund < ActiveRecord::Base
	has_many :expenses, dependent: :destroy
	self.inheritance_column = nil
	validates :type,presence: true, uniqueness: {case_sensitive: false}
	validates :amount,presence: true, numericality: {greater_than_or_equal_to:0}
	validate :value_of_amount_on_update, on: :update
	validate :value_of_amount_on_create, on: :create

	def value_of_amount_on_update
		balance = Finance.sum(:amount) - Fund.sum(:amount)
		allow_amount = Fund.find(self.id).amount + balance
	  if(!self.amount.blank?)
      if (self.amount + Fund.sum(:amount) - Fund.find(self.id).amount) > Finance.sum(:amount)
		errors.add(:amount, "Insufficient balance: " + balance.to_s)
		errors.add(:amount, "Maximum allowed amount: " + allow_amount.to_s)
	  end
	  else
	  	errors.add(:amount, "can't be blank and must be numbers")
	  end
    end

    def value_of_amount_on_create
    	balance = Finance.sum(:amount) - Fund.sum(:amount)
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
    end

    def set_values(user_params)
    	self.amount = user_params[:amount]
    end

    def to_label
        "#{type} Fund"
    end
end
