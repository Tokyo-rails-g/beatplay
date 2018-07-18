class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.discs.build
    @product.discs.musics.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = '商品を追加しました！'
      redirect_to admins_products_index_path
    else
      @products = Post.all
      flash[:notice] = '商品を追加できませんでした。もう一度投稿してください。'
      render :index
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
       flash[:notice] = "商品を更新しました！"
       redirect_to admins_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "商品を削除しました。"
      redirect_to admins_products_index_path
    else
      render :index
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
    @cartitem = CartItem.new
  end

  def add_cart_item
    @cartitem = CartItem.new(cart_item_params)
    @product = Product.find(params[:id])
    @cart = Cart.find_by(user_id: current_user)
    @cartitem.cart_id = @cart.id
    @cartitem.product_id = @product.id
    binding.pry
    @cartitem.save
    redirect_to products_path
  end

  private
  	def product_params
  		params.require(:product).permit(:album_title, :artist, :label, :category_id, :favorite_count, :image_url, :price, :stock, :release_year)
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
