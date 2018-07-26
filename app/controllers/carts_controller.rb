class CartsController < ApplicationController

    # before_action :setup_cart_item!, only: [:index, :destroy]

  def index
    @cart = Cart.find_by(user_id: current_user)
    @cart_item = CartItem.find_by(params[:cart_id])
    if @cart_item == nil
      @trigger_numb = 1
      @user = current_user
    else
      @trigger_numb = 2
      @user = current_user
      @cart_items = @cart.cart_items
      # binding.pry
      @cart_item.subtotal = @cart_item.product.price * @cart_item.quantity

      @total = 0 #初期化
      @cart_items.each do |cart_item|
        @total = @total + cart_item.subtotal.to_i
      end
    end
  end

  # カート内商品を全て削除
  def destroy
    @cart_items = CartItem.all
    @cart_items.each do |cart_item|
      cart_item.destroy
    end
    redirect_to carts_path
  end

    # private

    # def setup_cart_item!
    #   @cart_item = current_cart.cart_items.find_by(product_id[:product_id])
    # end

end
