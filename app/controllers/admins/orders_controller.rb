class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Order.search(params[:q])
    @orders = @q.result.page(params[:page]).per(30).reverse_order
  end

  def show
  	@order = Order.find(params[:id])
  	@order_items = @order.order_items
    @user = User.find_by(id: @order.user_id)
    @address = Address.last
  	# @order_item = OrderItem.find(params[:id])
  	# @user = @order.users
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admins_orders_index_path
    else

    end
  end

# showページでのupdateアクション
  def update2
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admins_order_show_path(@order)
    else

    end
  end




  private
    def order_params
      params.require(:order).permit(:user_id, :address_id, :total, :payment, :status)
    end

end