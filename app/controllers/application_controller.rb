class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl
  #before_filter :admin_authorize

  private

 def current_cart
 	Cart.find(session[:cart_id])
 	rescue ActiveRecord::RecordNotFound
 	cart = Cart.create
 	session[:cart_id] = cart.id
 	cart
 end

 protected

 def admin_authorize
 unless User.find_by_id(session[:user_id])
 redirect_to login_url, notice: "Please log in"
 end
 end
end
