class FavoritesController < ApplicationController
  def create
  	@product = Product.find(params[:product_id])

  	@favorite = current_user.favorites.find_by(product_id: @product.id)

  	if @favorite.blank?
	    favorite = current_user.favorites.new(product_id: @product.id)
      @product.favorite_count = @product.favorite_count + 1
      @product.save
  	  favorite.save
  	  flash[:success] = '商品をお気に入りに追加しました。'
  		redirect_to product_path(@product.id)
    else
    	flash[:success] = 'こちらの商品は既にお気に入りに入っております。'
    	redirect_to product_path(@product.id)
    end
  end

  def destroy
  	@product = Product.find(params[:product_id])
    @product.favorite_count = @product.favorite_count - 1
    @product.save
  	favorite = current_user.favorites.find_by(product_id: params[:product_id])
  	favorite.destroy
  	flash[:success] = '商品をお気に入りから削除しました。'
  	redirect_to mypage_user_path(current_user)
  end

  private
  	def product_params
  		params.require(:product).permit(:album_title, :artist, :label, :category_id, :favorite_count, :image_id, :price, :stock, :release_year)
  	end

end
