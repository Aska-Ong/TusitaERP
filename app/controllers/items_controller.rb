class ItemsController < ApplicationController
before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show, :new, :create]
add_breadcrumb "Home", :root_path
add_breadcrumb "Item", :items_path

  def index
    @items = Item.paginate(page: params[:page])
  end 

  def show
    @item = Item.find(params[:id])
    add_breadcrumb "Item Details"
  end

  def new
  	@item = Item.new
    add_breadcrumb "New Item"
  end

  def edit
    @item = Item.find(params[:id])
    add_breadcrumb "Edit Item"
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(user_params)
      flash[:success] = "Record updated"
      redirect_to @item
    else
      render 'edit'
    end
  end

  def create
    @item = Item.new(user_params)
    if @item.save
      flash[:success] = "New record saved!"
      redirect_to items_path
    else
      render 'new'
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    flash[:success] = "Record deleted."
    redirect_to items_path
  end

  private

    def user_params
      params.require(:item).permit(:name)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

end
