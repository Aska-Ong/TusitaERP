class FinancesController < ApplicationController
  def new
  	@finance = Finance.new
  end

end
