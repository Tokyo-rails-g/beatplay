class Admins::DiscsController < ApplicationController
	def new
    	@product = Product.find(params[:product_id])
    	@disc = Disc.new
  	end

  	def create
    	@product = Product.find(params[:product_id])
    	@disc = Disc.new(disc_params)
    	@disc.product_id = @product.id
   		@disc.save
    	redirect_to new_admins_product_disc_music_path(@product.id, @disc.id)
  	end

  	def edit
  		@disc = Disc.find(params[:id])
  	end

  	def update
  		@product = Product.find(params[:product_id])
    	@disc = Disc.find(params[:id])
    	if @product.update(update_product_params)
       		flash[:notice] = " ディスクを更新しました！"
       		redirect_to edit_admins_product_disc_path(@product)
    	else
      		render :update
    	end
  	end

private

  	def disc_params
    	params.require(:disc).permit(:product_id, :disc_number)
  	end
end

