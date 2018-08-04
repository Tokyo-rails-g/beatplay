class OrdersController < ApplicationController
    before_action :authenticate_user!
# addressの#newにあたる
  def new
    @q = Product.includes(:discs,:musics).ransack(params[:q])
    @q2 = Music.ransack(params[:q])
    @cart = Cart.find_by(user_id: current_user)
    @cart_items = @cart.cart_items
    @cart_items.each do |cart_item|
      if cart_item.product.stock <= 0
        flash[:danger] = "購入希望数の在庫がありません。"
        redirect_to carts_path
      end
    end
    @user = current_user
    # @address = Address.new( user_id: @user.id, first_name: @user.first_name,last_name: @user.last_name,pref: @user.pref, postal_code: @user.postal_code,city: @user.city, address1: @user.address1, address2: @user.address2 )
    @address = Address.new
    @addresses = Address.where(user_id: current_user).last(5)
  end

# 購入確認画面
  def confirm
    @c_i_counter = CartItem.count
    @cart = Cart.find_by(user_id: current_user)
    @cart_items = @cart.cart_items
    @order = Order.new

    @user = current_user
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    # if @address.valid?
      @total = 0
      @cart_items.each do |cart_item|
        @total = @total + cart_item.subtotal.to_i
      end
    # else
    #   @user = current_user
    #   render :new
    # end
  end

  def confirm_user
    @c_i_counter = CartItem.count
    @cart = Cart.find_by(user_id: current_user)
    @cart_items = @cart.cart_items
    @order = Order.new
    @user = current_user
    @address = Address.new( user_id: @user.id, first_name: @user.first_name,last_name: @user.last_name,pref: @user.pref, postal_code: @user.postal_code,city: @user.city, address1: @user.address1, address2: @user.address2 )
    # @address = Address.new(address_params)
    # @address = Address.new(address_params)

    @address.user_id = current_user.id

    @total = 0
    @cart_items.each do |cart_item|
      @total = @total + cart_item.subtotal.to_i
    end
    # binding.pry
  end

# 注文を確定するボタンが押されたときに呼ばれるアクション
  def create
    @order = Order.new(order_params)
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
    @order.user_id = current_user.id
    @address = Address.new(address_params)
    @history_address = Address.find_by(address_params)
    if @history_address == nil
      @address.user_id = current_user.id
      @address.save
      @order.address_id = @address.id
    else
      @address.user_id = current_user.id
      @order.address_id = @history_address.id
    end
    # @order.address_id = @address.id
    @order.status = 0.to_i
    @order.user_id = @cart.user_id
    if @order.save
    # カートアイテムIDをオーダーアイテムIDにコピーし、@order_itemを保存
      # @cart_items = @cart.cart_items
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
        redirect_to order_path(@order)

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
    
    def address_params
      params.require(:address).permit(:first_name, :last_name, :pref, :postal_code, :city, :address1, :address2)
    end

    def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
    end

    def order_item_params
      params.require(:order_item).permit(:product_id, :price, :quantity)
    end

    def order_params
      params.require(:order).permit(:total, :payment, :status, address_attributes: [ :first_name, :last_name, :pref, :postal_code, :city, :address1, :address2])
    end
end