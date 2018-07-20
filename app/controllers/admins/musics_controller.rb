class Admins::MusicsController < ApplicationController

  def new
  	@disc = Disc.find(params[:id])
  	@music = Music.new
  end

  def create
  	@product = Product.find(params[:id])
  	@disc = Disc.find(params[:id])
  	@music = Music.new
    @music.disc_id = @disc.id
    @music.save
    redirect_to admins_product_path(@product.id)
  end

private
  def music_params
    params.require(:music).permit(:disc_id,
                                  :name,
                                  :bpm,
                                  :duration,
                                  :track_number)
  end
end