class CartsController < ApplicationController

    before_action :setup_cart_item!, only: [:delete_item, :delete_all_item, :checkout]


# カート内商品一覧
# show→indexへ
  def index
    @cart = Cart.find_by(user_id: current_user)
    @cart_item = CartItem.find_by(params[:cart_id])
    @user = current_user
    @cart_items = @cart.cart_items
    # binding.pry
    @cart_item.subtotal = @cart_item.product.price * @cart_item.quantity
    @total = 0
    @cart_items.each do |cart_item|
      @total = @total + cart_item.subtotal.to_i
    end
  end

  # def delete_item
  #   cart_items#destroyへ移行
  # end

  # カート内商品を全て削除
  # カートは削除しない！
  def destroy
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
  # def checkout
  #   redirect_to orders_address_select_path(current_user.id)
  # end


  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(product_id[:product_id])
  end

end
