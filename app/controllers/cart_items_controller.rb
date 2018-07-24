class CartItemsController < ApplicationController

	before_action :setup_cart_item!, only: [:delete_item, :delete_all_item, :checkout]
	
# カート内商品の数量変更
	def update
		@cart = Cart.find_by(user_id: current_user)
    	# @cart_items = @cart.cart_items
		@cart_item = CartItem.find(params[:cart_id])
		@user = current_user
		if  @cart_item.quantity < @cart_item.product.stock
			@cart_item.update(cart_item_params)
			# redirect_to orders_select_address_path(@user)
			redirect_to carts_path
		else
			flash[:danger] = "在庫が購入希望枚数ありません！"
		end
	end

# カート内１商品の削除
	def destroy
		@cart = Cart.find_by(user_id: current_user)
		@cart_item = CartItem.find(params[:id])
		@user = current_user
	    if @cart_item.product_id.blank?
	    	flash[:danger] = "すでにありません"
	    	redirect_to carts_path(@cart)
	    else
	    	flash[:success] = @cart_item.product.album_title + "をカートから削除しました"
	    	@cart_item.destroy
	    	redirect_to carts_path
	    end
	end



	private

	def cart_item_params
		params.require(:cart_item).permit(:cart, :product, :quantity)
	end

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(product_id[:product_id])
  end
end
