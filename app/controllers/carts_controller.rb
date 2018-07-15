class CartsController < ApplicationController


  def add_cart_item
  end

# カート内商品一覧
  def show
    @cart_item = Cart.find(params[:id])
    @user_id = current_user_id

  end

  def delete_item
  end

  def delete_all_items
  end

  def checkout
  end


  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(product_id[:product_id])
  end

end
