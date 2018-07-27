class Admins::OrdersController < ApplicationController

  def index
    @q = Order.search(params[:q])
    @orders = @q.result.page(params[:page]).per(30).reverse_order
  end

  def show
  	@order = Order.find(params[:id])
  	@order_items = @order.order_items
  	# @order_item = OrderItem.find(params[:id])
  	# @user = @order.user
  end

  def update
    @order = Order.find(params[:id])
    if @order.save
      # binding.pry
      redirect_to admins_orders_index_path
    else
      flash[:danger] = "ステータスを更新できていません"
    end
  end




  private
    def order_params
      params.require(:order).permit(:user_id, :address_id, :total, :payment, :status)
    end

end