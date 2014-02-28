class TransportsController < ApplicationController
	before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show, :new, :create]

	def index
		@transports = Transport.paginate(page: params[:page])
	end 

	def show
    	@transport = Transport.find(params[:id])
  	end

  	def new
  		@transport = Transport.new
  	end

  	def edit
    	@transport = Transport.find(params[:id])
  	end

  	def update
    	@transport = Transport.find(params[:id])
    	if @transport.update_attributes(user_params)
      		flash[:success] = "Details updated"
      		redirect_to @transport
    	else
      		render 'edit'
    	end
  	end

  	def create
    	@transport = Transport.new(user_params)
    	if @transport.save
      		flash[:success] = "New record saved!"
      		redirect_to transports_path
    	else
      		render 'new'
    	end
  	end

  	def destroy
    	Transport.find(params[:id]).destroy
    	flash[:success] = "Record deleted."
    	redirect_to transports_path
  	end

  	private

    	def user_params
      		params.require(:transport).permit(:name,:email,:contact_number)
    	end

    	def signed_in_user
      		unless signed_in?
        	store_location
        	redirect_to signin_url, notice: "Please sign in."
      	end
    end
end
