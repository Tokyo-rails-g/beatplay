class DiscController < ApplicationController

  def new_disc
    @product = Product.find(params[:product_id])
    @disc = Disc.new
  end

  def create_disc
    @product = Product.find(params[:product_id])
    @disc = Disc.new(disc_params)
    @disc.product_id = @product.id
    @disc.save
    redirect_to admins_new_music_path(@product.id, @disc.id)
  end

  def edit
  	@disc = Disc.find(params[:id])
  end

  def update
  	@product = Product.find(params[:product_id])
    @disc = Disc.find(params[:id])
    if @product.update(update_product_params)
       flash[:notice] = " ディスクを更新しました！"
       redirect_to admins_new_disc_path(@product)
    else
      render :update
    end
  end
end



private

  def disc_params
    params.require(:disc).permit(:product_id,
                                :disc_number)
  end
end