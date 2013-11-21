class FundsController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show, :new, :create, :report]
  
  def index
    @funds = Fund.paginate(page: params[:page])
  end 

  def show
    @fund = Fund.find(params[:id])
  end

  def new
  	@fund = Fund.new
  end

  def edit
    @fund = Fund.find(params[:id])
  end

  def update
    @fund = Fund.find(params[:id])
    @fund.set_values(params)
    if @fund.update_attributes(user_params)
        flash[:success] = "Record updated"
        redirect_to @fund
    else
      render 'edit'
    end
  end

  def create
    @fund = Fund.new(user_params)
    @fund.set_values(user_params)
    if @fund.save
      flash[:success] = "New record saved!"
      redirect_to funds_path
    else
      render 'new'
    end
  end

  def destroy
    Fund.find(params[:id]).destroy
    flash[:success] = "Record deleted."
    redirect_to funds_path
  end
  
  def report
  end

  private

    def user_params
      params.require(:fund).permit(:type,
                                    :amount)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
