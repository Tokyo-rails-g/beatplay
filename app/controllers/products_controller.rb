class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:add_cart_item]

# 商品一覧
  def index
    @alert_few = "残りわずか！"
    @alert_zero = "在庫なし"

    @user = current_user
    @cart = Cart.find_by(user_id: current_user)

    #検索用
    @q = Product.includes(:discs,:musics).ransack(params[:q])
    @searchproducts = @q.result.page(params[:page]).per(15).distinct

    @productall = Product.all
    @searchproducts2 = @q.result.distinct
    @msg = '検索キーワードに当てはまる商品が見つかりませんでした。'
    @q2 = Music.ransack(params[:q])
  end

  def bpms
    @q2 = Music.ransack(params[:q])
    @searchproducts = @q2.result.page(params[:page]).per(15)

    @productall = Music.all
    @searchproducts2 = @q2.result
    @msg = '検索キーワードに当てはまる商品が見つかりませんでした。'

    @q = Product.includes(:discs,:musics).ransack(params[:q])
  end

  def show
  	@product = Product.find(params[:id])
    @cartitem = CartItem.new
    @q = Product.includes(:discs,:musics).ransack(params[:q])
    @q2 = Music.ransack(params[:q])
    @alert_few = "残りわずか！"
    @alert_zero = "在庫なし"
  end

  def new
    @product = Product.new
  end

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
    if @cartitem.quantity.nil?
      flash[:success] = "数量を入れて下さい。"
      redirect_to product_path(@product.id)
    else
      @cart = Cart.find_by(user_id: current_user)
      @cartitems = @cart.cart_items.find_by(product_id: @product.id) #自分のカート内に今入れようとしている商品があるかの確認　無ければnilで返答
      @cartitem.subtotal = @product.price * @cartitem.quantity

      if @cartitems.blank?
        @cartitem.cart_id = @cart.id
        @cartitem.product_id = @product.id
        # bining.pry
        @cartitem.save
        flash[:success] = "『" + @product.album_title + "』がカートに入りました"
        redirect_to products_path
        # redirect_to carts_path(@cart)
      else
        @cartitems.quantity = @cartitems.quantity + @cartitem.quantity
        if @cartitems.quantity <= @product.stock
          @cartitems.save
          flash[:success] = "『" + @product.album_title + "』の数量が変更されました"
          redirect_to products_path
          # redirect_to carts_path(@cart)
        else
          flash[:success] = "商品の在庫の数量を超えております"
          redirect_to product_path(@product.id)
        end
      end
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      # binding.pry
      flash[:notice] = "商品を更新しました！"
      redirect_to admins_product_path(@product.id)
    else
      render :edit
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
      params.require(:cart_item).permit(:cart_id, :product_id, :quantity, :subtotal)
    end

    def product_params
    params.require(:product).permit(:artist,
                                    :album_title,
                                    :image,
                                    :price,
                                    :category_id,
                                    :label,
                                    :release_year,
                                    :stock,
                                    discs_attributes: [:id,
                                                      :disc_number,
                                                      :_destroy,
                                                      :product_id,
                                                      musics_attributes: [:id,
                                                                         :disc_id,
                                                                         :name,
                                                                         :bpm,
                                                                         :duration,
                                                                         :track_number,
                                                                         :_destroy
                                                                       ]
                                                                      ]
                                                                    )
  end
end
