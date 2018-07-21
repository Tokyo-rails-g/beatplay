class Admins::MusicsController < ApplicationController

  def new
    @disc = Disc.find(params[:disc_id])
    @product = @disc.product
  	@music = Music.new
  end

  def create
  	@disc = Disc.find(params[:disc_id])
    @product = @disc.product
  	@music = Music.new
    @music.disc_id = @disc.id
    @music.save
    redirect_to admins_product_path(@product.id)
  end

  def edit
  end

  def update
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