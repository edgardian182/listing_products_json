class Api::V1::ProductsController < ApplicationController

  def index
    products = Product.all
    render json: products
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: :created
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: product, status: :ok
    else
      render json: product, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    head 204
  end

  private
  def product_params
    params.require(:product).permit(:name,:price)
  end
end