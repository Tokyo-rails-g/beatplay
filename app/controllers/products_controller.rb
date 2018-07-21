class ProductsController < ApplicationController

  #PER = 15

# 商品一覧
  def index
    #@products = Product.page(params[:page]).per(PER)
    @user = current_user
    @cart = Cart.find_by(user_id: current_user)

    #検索用
    @q = Product.ransack(params[:q])
    @searchproducts = @q.result.page(params[:page]).per(15)
    binding.pry
  end

  def show
  	@product = Product.find(params[:id])
    @cartitem = CartItem.new
  end

  # def new
  #   @product = Product.new
  # end

    # def create
    #   @product = Product.new(product_params)
    #   if @product.save
    #     @disc = @product.discs.new(disc_params)
    #     @disc.product_id = @product.id
    #     @disc.save
    #     flash[:notice] = '商品を追加しました！'
    #     redirect_to admins_new_music_path(@product.id)
    #   else
    #     flash[:notice] = '商品を追加できませんでした。もう一度投稿してください。'
    #     render :index
    #   end
    # end

  def add_cart_item
    @cartitem = CartItem.new(cart_item_params)
    @product = Product.find(params[:id])
    @cart = Cart.find_by(user_id: current_user)

    @cartitems = @cart.cart_items.find_by(product_id: @product.id) #自分のカート内に今入れようとしている商品があるかの確認　無ければnilで返答

    if @cartitems.blank?
      @cartitem.cart_id = @cart.id
      @cartitem.product_id = @product.id
      @cartitem.save
      redirect_to products_path
    else
      @cartitems.quantity = @cartitems.quantity + @cartitem.quantity
      @cartitems.save
      redirect_to edit_user_path(current_user)
    end
  end

  private
  	def product_params
  		params.require(:product).permit(:album_title, :artist, :label, :category_id, :favorite_count, :image_id, :price, :stock, :release_year)
  	end

  	def category_params
  		params.require(:category).permit(:name)
  	end

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
