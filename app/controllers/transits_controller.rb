class TransitsController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show, :new, :create]

  def index
    @transits = Transit.paginate(page: params[:page])
  end 

  def show
    @transit = Transit.find(params[:id])
  end

  def new
  	@transit = Transit.new
  end

  def edit
    @transit = Transit.find(params[:id])
  end

  def update
    @transit = Transit.find(params[:id])
    if @transit.update_attributes(user_params)
      flash[:success] = "Record updated"
      redirect_to transits_path
    else
      render 'edit'
    end
  end

  def create
    @transit = Transit.new(user_params)
    if @transit.save
      flash[:success] = "New record saved!"
      redirect_to transits_path
    else
      render 'new'
    end
  end

  def destroy
    Transit.find(params[:id]).destroy
    flash[:success] = "Record deleted."
    redirect_to transits_path
  end
  
  def complete
    Transit.update_all(["status=1"], :id => params[:transit_ids])
    TransitMailer.complete_email(Member.find(40)).deliver
    flash[:success] = "Transit status changed to completed!"
    redirect_to transits_path
  end

  def pending
    Transit.update_all(["status=0"], :id => params[:transit_ids])
    flash[:success] = "Transit status changed to pending!"
    redirect_to transits_path
  end

  private

    def user_params
      params.require(:transit).permit(:date, :time,
                                   :food,:flight_no,
                                   :transportation,:accommodation,{:member_ids => []},{:transport_ids => []},:status)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
