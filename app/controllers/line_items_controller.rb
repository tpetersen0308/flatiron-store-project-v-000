class LineItemsController < ApplicationController

  def create
    current_user.current_cart.add_item(params.require(:item_id))
    current_user.current_cart.save
    redirect_to cart_path(current_user.current_cart)
  end
end
