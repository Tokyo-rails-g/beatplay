class Admins::OrdersController < ApplicationController
  PER = 30

  def index
  	@orders = Order.page(params[:page]).per(PER).reverse_order
  end

  def show
  	@order = Order.find(params[:id])
  	@order_items = @order.order_items
  	# binding.pry
  	# @order_item = OrderItem.find(params[:id])
  	# @user = @order.user
  	# binding.pry
  end




  private
    def order_params
      params.require(:order).permit(:user, :address, :total, :payment, :status)
    end

end