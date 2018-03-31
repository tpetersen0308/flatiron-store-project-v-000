class LineItemsController < ApplicationController
  before_action :build_or_get_current_cart, only: [:create]

  def create
    @cart.add_item(params.require(:item_id))
    @cart.save
    redirect_to cart_path(@cart)
  end

  private
    def build_or_get_current_cart
      if current_user.current_cart.nil?
        @cart = Cart.create(user_id: current_user.id)
      else
        @cart = current_user.current_cart
      end
    end
end
