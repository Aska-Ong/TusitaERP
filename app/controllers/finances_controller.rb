class FinancesController < ApplicationController

  def show
    @finance = Finance.find(params[:id])
  end

  def new
  	@finance = Finance.new
  end

  def update
    if @finance.update_attributes(user_params)
      flash[:success] = "Record updated"
      redirect_to @finance
      render 'edit'
    end
  end

  def create
    @finance = Finance.new(user_params)
    if @finance.save
      flash[:success] = "New record saved!"
      redirect_to @finance
    else
      render 'new'
    end
  end

  def destroy
    Finance.find(params[:id]).destroy
    flash[:success] = "Record deleted."
    redirect_to finances_path
  end

  private

    def user_params
      params.require(:finance).permit(:type, :amount,
                                   :date, :description)
    end

end
