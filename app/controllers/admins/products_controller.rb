class Admins::ProductsController < ApplicationController
PER = 30

  def index
    @products = Products.page(params[:page]).per(PER)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    if params[:product].present?
      @product = Product.new(product_params)
      @product.save
      flash[:notice] = '商品を追加しました！'
      redirect_to admins_new_disc_path(@product.id)
      else
      @product = Product.new
    end
  end

  def create
    @product = Product.new(product_params)
    # if @product.save
    #   @disc = @product.discs.new(disc_params)
    #   @disc.product_id = @product.id
    #   @disc.save
    #   flash[:notice] = '商品を追加しました！'
    #   redirect_to admins_new_music_path(@product.id)
    # else
    #   flash[:notice] = '商品を追加できませんでした。もう一度投稿してください。'
    #   render :index
    # end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    binding.pry
    if @product.update(update_product_params)
       flash[:notice] = "商品を更新しました！"
       redirect_to admins_edit_disc_path(@product)
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
                                    :stock)
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
                                    :stock,)
  end

  def destroy_product_params
      params.require(:product).permit(:artist,
                                    :album_title,
                                    :image,
                                    :price,
                                    :category_id,
                                    :label,
                                    :favorite_count,
                                    :release_year,
                                    :stock,
                                    discs_attributes:[:id,
                                                      :disc_number,
                                                      ],
                                    musics_attributes:[:disc_id,
                                                      :album_title,
                                                      :bpm,
                                                      :duration,
                                                      :track_number
                                                      ])
  end
end
