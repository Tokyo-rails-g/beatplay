class OrdersController < ApplicationController

  def select_address
    
    @address = Address.new
    @user = current_user
    
  end

# 新たに送り先を指定したとき
  def create_address
    @address = Address.new(address_params)
    @user = current_user
    if @address.save
      # 購入確認画面にリダイレクト
      redirect_to orders_confirm_path(@address)
    end
  end
# 購入確認画面
  def confirm
    # ログインしているユーザーに紐付いたカートIDを取得
    @cart = Cart.find_by(user_id: current_user)
    # カート内のすべてのカートアイテムを取得
    @cart_items = @cart.cart_items
    @order = Order.new
    # Addressモデルのデータから最後のデータを引っ張ってくる
    @address = Address.last
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
    @user = current_user
  end



  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :postal_code, :city, :address1)
  end

  def order_item_params
    params.require(:order_item).permit(:order_id, :product_id, :price, :quantity)
  end
  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :product_id, :quantity)
  end
end
