class OrdersController < ApplicationController

  def select_address
    @address = Address.new
    @address.user_id = current_user.id
    @user = current_user
  end

# 新たに送り先を指定したとき
  def create_address
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    @user = current_user
    if @address.save
      # 購入確認画面にリダイレクト
      redirect_to orders_confirm_path(@address)
    end
      @address = Address.new(address_params)
      # render :select_address
  end
# 購入確認画面
  def confirm
    # ログインしているユーザーに紐付いたカートIDを取得
    @c_i_counter = CartItem.count
    @cart = Cart.find_by(user_id: current_user)
    # カート内のすべてのカートアイテムを取得
    @cart_items = @cart.cart_items
    @order = Order.new
    # Addressモデルのデータから最後のデータを引っ張ってくる
    @address = Address.last
    @user = current_user

    @total = 0
    @cart_items.each do |cart_item|
      @total = @total + cart_item.subtotal.to_i
    end
    # binding.pry
  end

# 注文を確定するボタンが押されたときに呼ばれるアクション
  def create
    @order = Order.new
    @user = current_user
    # @user.id = @cart.user_id
    # ログインしているユーザーに紐付いたカートIDを取得
    @cart = Cart.find_by(user_id: current_user)
    # カート内のすべてのカートアイテム情報を取得
    @cart_items = @cart.cart_items

    @total = 0
    @cart_items.each do |cart_item|
      @total = @total + cart_item.subtotal.to_i
    end
    @order.total = @total
    # binding.pry
    @order.user_id = current_user.id
    if  @address != nil
        @address = Address.last
        @order.address_id = @address.id
    end
    # order.saveされる前に、cartsテーブルのuser_idをordersテーブルのuser_idに格納
    @order.status = 0.to_i
    @order.user_id = @cart.user_id
 
    if @order.save
    # カートアイテムIDをオーダーアイテムIDにコピーし、@order_itemを保存
      # @order_items = OrderItem.new

      @cart_items = @cart.cart_items
      @cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.product_id = cart_item.product_id
        @order_item.price = cart_item.product.price
        @order_item.quantity = cart_item.quantity
        cart_item.product.stock -= cart_item.quantity
        @order_item.save
        cart_item.product.save
        cart_item.destroy
      end
    # binding.pry
        redirect_to show_order_path


    else
      puts @order.errors.full_messages

    end
  end






# 購入完了画面で使用するアクション
  def show
    @user = current_user
    @order = Order.where(user_id: current_user).last
  end



  private
    def order_params
      params.require(:order).permit(:user_id, :address_id, :total, :payment, :status)
    end

  def address_params
    params.require(:address).permit(:user, :first_name, :last_name, :postal_code, :city, :address1, :address2)
  end

  def order_item_params
    params.require(:order_item).permit(:order_id, :product_id, :price, :quantity)
  end
  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :product_id, :quantity)
  end
end
