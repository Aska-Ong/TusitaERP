class MinutesController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show, :new, :create]

  def index
    @minutes = Minute.paginate(page: params[:page]).per_page(5)
  end 

  def show
    @minute = Minute.find(params[:id])
  end

  def new
  	@minute = Minute.new
  end

  def edit
    @minute = Minute.find(params[:id])
  end

  def update
    @minute = Minute.find(params[:id])
    if @minute.update_attributes(user_params)
      flash[:success] = "Record updated"
      redirect_to @minute
    else
      render 'edit'
    end
  end

  def create
    @minute = Minute.new(user_params)
    if @minute.save
      flash[:success] = "New record saved!"
      redirect_to minutes_path
    else
      render 'new'
    end
  end

  def destroy
    Minute.find(params[:id]).destroy
    flash[:success] = "Record deleted."
    redirect_to minutes_path
  end

  private

    def user_params
      params.require(:minute).permit(:name,
                                   :date, :content)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end