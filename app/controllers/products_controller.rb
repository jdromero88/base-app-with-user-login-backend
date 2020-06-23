class ProductsController < ApplicationController
  def index
    @products = Products.all
    render json: @products
  end
end
