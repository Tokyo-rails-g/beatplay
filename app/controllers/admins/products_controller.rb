class Admins::ProductsController < ApplicationController
  def index
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
    params.require(:product)
  end

end
