class FinancesController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show, :new, :create]

  def index
    @finances = Finance.paginate(page: params[:page])
  end 

  def show
    @finance = Finance.find(params[:id])
  end

  def new
  	@finance = Finance.new
  end

  def edit
    @finance = Finance.find(params[:id])
  end

  def update
    @finance = Finance.find(params[:id])
    if @finance.update_attributes(user_params)
      flash[:success] = "Record updated"
      redirect_to @finance
    else
      render 'edit'
    end
  end

  def create
    @finance = Finance.new(user_params)
    if @finance.save
      flash[:success] = "New record saved!"
      redirect_to finances_path
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
      params.require(:finance).permit(:amount,
                                   :date, :description)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end
