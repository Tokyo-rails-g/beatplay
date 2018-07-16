class Admins::OrdersController < ApplicationController
  PER = 30

  def index
  	@orders = Order.page(params[:page]).per(PER)
  end

  def show
  	@order = Order.find(params[:id])
  	@order_item = Order_item.find(params[:id])
  end

end