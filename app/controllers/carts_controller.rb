class CartsController < ApplicationController

  def checkout
    current_user.current_cart.checkout
    redirect_to cart_path(params[:id])
  end

  
end
