class Admins::ProductsController < ApplicationController
  protect_from_forgery except: :new
  # skip_before_filter :verify_authenticity_token
  before_action :authenticate_admin!

  def index
    #検索用
    @q = Product.includes(:discs,:musics).ransack(params[:q])
    @searchproducts = @q.result.page(params[:page]).per(30).distinct

    @productall = Product.all
    @searchproducts2 = @q.result
    @msg = '商品が見つかりませんでした。'
  end


  def show
    @product = Product.find(params[:id])
    @orders = Order.last(5)
    # @orders = Order.find_by(params[:product_id])
    @disc = Disc.find_by(params[:product_id])
  end

  def new
    if params[:product].present?
      @product = Product.all
      render plain: Product.where(artist: 渋谷慶一郎).pluck(:album_title)
      @product = Product.new(product_params)
      @product.save
      # disc = @product.discs.build
      # disc.product_id = @product.id
      # disc.save
      # music = disc.musics.build
      # music.disc_id = disc.id
      # # binding.pry
      # music.save
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

  # def update
  #   @product = Product.find(params[:id])
  #   if @product.update(product_params)
  #     # binding.pry
  #     flash[:notice] = "商品を更新しました！"
  #     redirect_to admins_product_path(@product.id)
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "商品を削除しました。"
      redirect_to admins_products_path
    else
      @products = Product.page(params[:page]).per(PER)
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
                                                      :product_id,
                                                      musics_attributes:[:id,
                                                                         :disc_id,
                                                                         :name,
                                                                         :bpm,
                                                                         :duration,
                                                                         :track_number,
                                                                         :_destroy]])
  end


# def update_product_params
#     params.require(:product).permit(:artist,
#                                     :album_title,
#                                     :image,
#                                     :price,
#                                     :category_id,
#                                     :label,
#                                     :release_year,
#                                     :stock,
#                                     discs_attributes: [:id,
#                                                       :disc_number,
#                                                       :_destroy,
#                                                       :product_id,
#                                                       musics_attributes: [:id,
#                                                                          :disc_id,
#                                                                          :name,
#                                                                          :bpm,
#                                                                          :duration,
#                                                                          :track_number,
#                                                                          :_destroy
#                                                                        ]
#                                                                       ]
#                                                                     )

#   end

end
