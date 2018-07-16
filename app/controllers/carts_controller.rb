class CartsController < ApplicationController


  def add_cart_item
  end

# カート内商品一覧
  def show
    @cart_item = Cart.find(params[:id])
    @user_id = current_user_id
  end

  def delete_item
    @cart_item = Cart.find(params[:id])
    # カート内に商品があるかを確認。ない場合はdestroyしない
    if Cart.exists?(id: params[:id])
      @cart_item.destroy
    else
      flash[:notice] = "カートは既に空です"
      render action: :show
  end

  def delete_all_items
    @cart_items = Cart.all
    if Cart.exists?(id: params[:id])
      @cart_item.destroy
    else
      flash[:notice] = "カートは既に空です"
      render action: :show
  end
# 購入手続きに進むボタンを押した時に呼ばれるアクション
  def checkout
    redirect_to orders_address_select_path(current_user.id)
  end


  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(product_id[:product_id])
  end

end
