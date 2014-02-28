class ForumsController < ApplicationController
add_breadcrumb "Home", :root_path
add_breadcrumb "Forum", :forums_path

  def show
    @forum = Forum.find(params[:id])
  end
  
  def new
    @forum = Forum.new
    add_breadcrumb "New Forum", :new_forum_path
  end
  
  def create
    @forum = Forum.new(params[:forum])
    
    if @forum.save
      flash[:notice] = "Forum was successfully created."
      redirect_to forums_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @forum = Forum.find(params[:id])
    add_breadcrumb "Edit Forum"
  end
  
  def update
    @forum = Forum.find(params[:id])
    
    if @forum.update_attributes(params[:forum])
      flash[:notice] = "Forum was updated successfully."
      redirect_to forum_url(@forum)
    end
  end
  
  def destroy
    @forum = Forum.find(params[:id])
    
    if @forum.destroy
      flash[:notice] = "Category was deleted."
      redirect_to forums_url
    end
  end
end