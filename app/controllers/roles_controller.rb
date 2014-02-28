class RolesController < ApplicationController
	before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show, :new, :create]

	def index
		@roles = Role.paginate(page: params[:page])
	end 

	def show
    	@role = Role.find(params[:id])
  	end

  	def new
  		@role = Role.new
  	end

  	def edit
    	@role = Role.find(params[:id])
  	end

  	def update
    	@role = Role.find(params[:id])
    	if @role.update_attributes(user_params)
      		flash[:success] = "Details updated"
      		redirect_to @role
    	else
      		render 'edit'
    	end
  	end

  	def create
    	@role = Role.new(user_params)
    	if @role.save
      		flash[:success] = "New record saved!"
      		redirect_to roles_path
    	else
      		render 'new'
    	end
  	end

  	def destroy
    	Role.find(params[:id]).destroy
    	flash[:success] = "Record deleted."
    	redirect_to roles_path
  	end

  	private

    	def user_params
      		params.require(:role).permit(:name,:inventory,:event,:transit,:forum)
    	end

    	def signed_in_user
      		unless signed_in?
        	store_location
        	redirect_to signin_url, notice: "Please sign in."
      	end
    end
end
