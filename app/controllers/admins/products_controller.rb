class Admins::ProductsController < ApplicationController
  def index
    @products = Products.page(params[:page]).per(PER)
  end

  def show
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def new
    @product = Product.new
  end

  def create
    @product = Products.new(product_params)
    @product.save
    redirect_to admins_products_index_path
  end

private

  def product_params
    params.require(:product).permit(
      :artist, :album_title, :price, :category_id, :label, :release_year, :stock, 
      discs_attributes:[:id, :disc_number, :_destroy])
  end

end
