class SessionsController < ApplicationController

  def new
    render :action => "new", :layout => "signin"
  end

  def create
  	user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to users_url
    else
      flash.now[:error] = 'Invalid username/password combination'
      render :action => "new", :layout => "signin"
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end