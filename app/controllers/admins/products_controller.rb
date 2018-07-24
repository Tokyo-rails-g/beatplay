class Admins::ProductsController < ApplicationController

  PER = 30

  def index
    @products = Product.page(params[:page]).per(PER)
  end

  def show
    @product = Product.find(params[:id])
    @orders = Order.last(5)
    @discs = Disc.find_by(params[:product_id])
  end

  def new
    if params[:product].present?
      @product = Product.new(product_params)
      @product.save
      disc = @product.discs.build
      disc.product_id = @product.id
      disc.save
      music = disc.musics.build
      music.disc_id = disc.id
      # binding.pry
      music.save
      flash[:notice] = '商品を追加しました！'
      redirect_to admins_product_path(@product.id)
    else
      @product = Product.new
    end
  end

  def create
    @product = Product.new(product_params)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if
      params[:to_edit_disc]
      @product.update(update_product_params)
      flash[:notice] = "商品を更新しました！"
      redirect_to edit_admins_product_disc_path(@product.id)
    elsif
      params[:to_add_disc] || params[:to_new_disc]
      @product.update(update_product_params)
      flash[:notice] = "商品を更新しました！"
      redirect_to new_admins_product_disc_path(@product.id)
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
    params.require(:product).permit(:artist,
                                    :album_title,
                                    :image,
                                    :price,
                                    :category_id,
                                    :label,
                                    :release_year,
                                    :stock,
                                    discs_attributes:[:id,
                                                      :disc_number,
                                                      :_destroy,
                                    musics_attributes:[:disc_id,
                                                      :album_title,
                                                      :bpm,
                                                      :duration,
                                                      :track_number,
                                                      :_destroy]])
  end

  def update_product_params
    params.require(:product).permit(:artist,
                                    :album_title,
                                    :image,
                                    :price,
                                    :category_id,
                                    :label,
                                    :favorite_count,
                                    :release_year,
                                    :stock)
  end

  def to_edit_disc_params
    prams.require(:product).permit(:artist,
                                    :album_title,
                                    :image,
                                    :price,
                                    :category_id,
                                    :label,
                                    :favorite_count,
                                    :release_year,
                                    :stock)
  end

  # def destroy_product_params
  #     params.require(:product).permit(:artist,
  #                                   :album_title,
  #                                   :image,
  #                                   :price,
  #                                   :category_id,
  #                                   :label,
  #                                   :favorite_count,
  #                                   :release_year,
  #                                   :stock,
  #                                   discs_attributes:[:id,
  #                                                     :disc_number,
  #                                                     :_destroy],
  #                                   musics_attributes:[:disc_id,
  #                                                     :album_title,
  #                                                     :bpm,
  #                                                     :duration,
  #                                                     :track_number,
  #                                                     :_destroy])
  # end
end
