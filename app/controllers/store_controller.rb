class StoreController < ApplicationController
	skip_before_filter :admin_authorize
  def index
  	#@products = Product.order(:title)
  	#kaminari
  	@products = Product.page(params[:page]).per(9)
    #will_paginate
    #@products = Product.paginate(:page => params[:page])

  	@cart = current_cart
  end
end
