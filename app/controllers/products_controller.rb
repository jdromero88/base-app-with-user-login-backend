class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: ProductSerializer.new(@products).to_serialized_json
  end

  def create
    @product = Product!(product_strong_params)
    if @product
      render json: ProductSerializer.new(@product).to_serialized_json
    else
      render json: {
        error:true,
        message: 'Product already exist.'
      }, status: :not_acceptable
    end
  end

  def show
    @product = Product.find(params[:id])
    # @product = Product.find_by(name: params[:name])
    if @product
      render json: ProductSerializer.new(@product).to_serialized_json
    else
      render json: {
        error: true,
        message: 'Product not found.'
      }
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product
      @product.update!(product_strong_params)
      render json: ProductSerializer.new(@product).to_serialized_json
    else
      render json: {
        error: true,
        message: 'Product not found.'
      }
    end
  end

  private
    def product_strong_params
      params.permit(
        :name,
        :description,
        :image,
        :price,
        :active
      )
    end
end
