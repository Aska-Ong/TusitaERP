class CategoriesController < ApplicationController
add_breadcrumb "Home", :root_path
add_breadcrumb "Forum", :forums_path

  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
    add_breadcrumb "New Category", :new_category_path
  end
  
  def create
    @category = Category.new(params[:category])
    
    if @category.save
      flash[:notice] = "Category was successfully created."
      redirect_to forums_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @category = Category.find(params[:id])
    add_breadcrumb "Edit Category"
  end
  
  def update
    @category = Category.find(params[:id])
    
    if @category.update_attributes(params[:category])
      flash[:notice] = "Category was updated successfully."
      redirect_to forums_url
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    
    if @category.destroy
      flash[:notice] = "Category was deleted."
      redirect_to forums_url
    end
  end
end