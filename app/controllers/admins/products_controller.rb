class Admins::ProductsController < ApplicationController
PER = 30

  def index
    @products = Products.page(params[:page]).per(PER)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new(product_params)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      @disc = @product.discs.new(disc_params)
      @disc.product_id = @product.id
      @disc.save
      flash[:notice] = '商品を追加しました！'
      redirect_to admins_add_music_path
    else
      @products = Post.all
      flash[:notice] = '商品を追加できませんでした。もう一度投稿してください。'
      render :index
    end
  end

  def new_music
    @product = Product.new
    @disc = @product.discs.new
    @music = @product.disc.musics.new
  end

  def add_music
    @music = @product.disc.musics.new
    @music.disc_id = @disc.id
    @music.save(music_params)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(update_product_params)
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

private

  def product_params
    params.require(:product).permit(
      :artist, :album_title, :price, :category_id, :label, :release_year, :stock)
  end

  def disc_params
    params.require(:disc).permit(:product_id, :disc_number)
  end

  def music_params
    params.require(:music).permit(:disc_id, :album_title, :bpm, :duration, :track_number)
  end

  def update_product_params
    params.require(:product).permit(
      :artist, :album_title, :price, :category_id, :label, :release_year, :stock, 
      discs_attributes:[:id, :disc_number, :_destroy], musics_attributes:[:disc_id, :album_title, :bpm, :duration, :track_number, :_destroy])
  end
end
