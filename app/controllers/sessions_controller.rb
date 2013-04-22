class SessionsController < ApplicationController
  #skip_before_filter :admin_authorize
  def new
    @title = "Log in"
  end

  def create
  	user = User.find_by_name(params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
        redirect_to admin_url, notice: "welcome in Administration"
    else
        redirect_to login_url, notice: "invalid user/password combination"
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url, notice: 'logged out'
  end
end
