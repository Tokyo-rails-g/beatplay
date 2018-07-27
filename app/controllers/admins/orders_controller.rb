class Admins::OrdersController < ApplicationController
  before_action: authentication_admin!, only[:index, :show]

  def index
    @q = Order.search(params[:q])
    @orders = @q.result.page(params[:page]).per(30).reverse_order
  end

  def show
  	@order = Order.find(params[:id])
  	@order_items = @order.order_items
  	# @order_item = OrderItem.find(params[:id])
  	# @user = @order.users
  end




  private
    def order_params
      params.require(:order).permit(:user_id, :address_id, :total, :payment, :status)
    end

end