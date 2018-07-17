class OrdersController < ApplicationController

  def select_address
    @user = current_user
    @address = Address.new
  end

# 新たに送り先を指定したとき
  def create_address
    @address = Address.new(address_params)
    if @address.save
      # 購入確認画面にリダイレクト
      redirect_to orders_confirm_path(@user)
    end
  end

# 購入確認画面
  def confirm
    @cart = current_cart
    @order = Order.new
    # @cart.cart_item = CartItem.find(params[:id])
    @address = Address.new
    # @address = Address.find(address_params)
    @user = current_user
  end

# 注文を確定するボタンが押されたときに呼ばれるアクション
  def create
    @order = Order.new
    @order_item = OrderItem.new(order_item_params)
    @cart_item = CartItem.find(params[:id])
    @user_id = current_user.id
    if @order.save
      @order.id = order_item.id
      @order_item.product_id = cart_item.product_id
      @cart_item.destroy
      redirect_to orders_show_path
    end
  end

# 購入完了画面で使用するアクション
  def show
  end



  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :postal_code, :prefecture, :city, :address1, :address2)
  end

  def order_item_params
    params.require(:order_item).permit(:order_id, :product_id, :price, :quantity)
  end
  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :product_id, :quantity)
  end
end
