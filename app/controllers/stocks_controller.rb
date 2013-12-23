class StocksController < ApplicationController
before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show, :new, :create]

  def index
    @stocks = Stock.paginate(page: params[:page])
  end 

  def show
    @stock = Stock.find(params[:id])
  end

  def new
  	@stock = Stock.new
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    if @stock.update_attributes(user_params)
      flash[:success] = "Record updated"
      redirect_to @stock
    else
      render 'edit'
    end
  end

  def create
    @stock = Stock.new(user_params)
    @stock2 = Stock.where({branch_id: user_params[:branch_id],item_id: user_params[:item_id]}).first
    if(!@stock2.blank?)
      @stock2.update_attributes(:count => @stock2.count.to_i + user_params[:count].to_i)
      flash[:success] = "New record saved!"
      redirect_to stocks_path
    else
      if @stock.save
        flash[:success] = "New record saved!"
        redirect_to stocks_path
      else
        render 'new'
      end
    end
  end

  def destroy
    Stock.find(params[:id]).destroy
    flash[:success] = "Record deleted."
    redirect_to stocks_path
  end

  private

    def user_params
      params.require(:stock).permit(:count,:branch_id,:item_id)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end
