class ProductsController < ApplicationController
  def index
  end

  def show
  	@product = Product.find(params[:id])
    #@cartitem = CartItem.new
  end








  private
  	def product_params
  		params.require(:product).permit(:album_title, :artist, :label, :category_id, :favorite_count, :image_url, :price, :stock, :release_year)
  	end

  	def category_params
  		params.require(:category).permit(:name)

  	def disc_params
  		params.require(:disc).permit(:product_id, :disc_number)
  	end

  	def music_params
  		params.require(:music).permit(:disc_id, :track_number, :name, :bpm, :duration)
  	end

    def cart_params
      params.require(:cart).permit(:user_id)
    end

    def cart_item_params
      params.require(:cart_item).permit(:cart_id, :product_id, :quantity)
    end
  end
end
