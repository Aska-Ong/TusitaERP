class BranchesController < ApplicationController
before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show, :new, :create]

  def index
    @branches = Branch.paginate(page: params[:page])
  end 

  def show
    @branch = Branch.find(params[:id])
  end

  def new
  	@branch = Branch.new
  end

  def edit
    @branch = Branch.find(params[:id])
  end

  def update
    @branch = Branch.find(params[:id])
    if @branch.update_attributes(user_params)
      flash[:success] = "Record updated"
      redirect_to @branch
    else
      render 'edit'
    end
  end

  def create
    @branch = Branch.new(user_params)
    if @branch.save
      flash[:success] = "New record saved!"
      redirect_to branches_path
    else
      render 'new'
    end
  end

  def destroy
    Branch.find(params[:id]).destroy
    flash[:success] = "Record deleted."
    redirect_to branches_path
  end

  private

    def user_params
      params.require(:branch).permit(:name)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end
