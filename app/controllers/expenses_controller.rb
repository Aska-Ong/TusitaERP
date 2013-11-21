class ExpensesController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show, :new, :create]
  
  def index
    @expenses = Expense.where(:fund_id => params[:where_action]).paginate(page: params[:page])
  end 

  def show
    @expense = Expense.find(params[:id])
  end

  def new
  	@expense = Expense.new
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.set_values(params)
    if @expense.update_attributes(user_params)
        flash[:success] = "Record updated"
        redirect_to funds_path
    else
      render 'edit'
    end
  end

  def create
    @expense = Expense.new(user_params)
    @expense.set_values(params)
    @expense.set_values(user_params)
    if @expense.save
      flash[:success] = "New record saved!"
      redirect_to funds_path
    else
      render 'new'
    end
  end

  def destroy
    Expense.find(params[:id]).destroy
    flash[:success] = "Record deleted."
    redirect_to funds_path
  end

  private

    def user_params
      params.require(:expense).permit(:amount,
                                    :description,
                                    :date,
                                    :fund_id)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
