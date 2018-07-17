class CartsController < ApplicationController

    before_action :setup_cart_item!, only: [:delete_item, :delete_all_item, :checkout]


# カート内商品一覧
  def show
    @cart = current_cart
    # @cart_item = CartItem.find(params[:id])
    @cart_item = CartItem.new
    @user = current_user
  end

  def delete_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_show_path
    # カート内に商品があるかを確認。ない場合はdestroyしない
    # if Cart.exists?(id: params[:id])
    #   @cart_item.destroy
    # else
    #   flash[:notice] = "カートは既に空です"
    #   render action: :show
    # end
  end

  def delete_all_items
    @cart_items = CartItem.all
    @cart_item.destroy
    redirect_to carts_show_path
    # if Cart.exists?(id: params[:id])
    #   @cart_item.destroy
    # else
    #   flash[:notice] = "カートは既に空です"
    #   render action: :show
    # end
  end
# 購入手続きに進む(レジに進む)ボタンを押した時に呼ばれるアクション
  def checkout
    redirect_to orders_address_select_path(current_user.id)
  end


  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(product_id[:product_id])
  end

end
