class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: PostSerializer.new(@posts).to_serialized_json
  end

  def create
    @post = Post.create!(post_strong_params)
    if @post
      render json: PostSerializer.new(@post).to_serialized_json
    else
      render json: {
        error: true,
        message: 'Something went wrong. Try again.'
      }
    end
  end

  def show
    @post = Post.find(params[:id])
    if @post
      render json: PostSerializer.new(@post).to_serialized_json
    else
      render json: {
        error: true,
        message: 'We did not find what you are looking for. Sorry not sorry.'
      }
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post
      @post.update!(post_strong_params)
      render json: PostSerializer.new(@post).to_serialized_json
    else
      render json: {
        error: true,
        message: 'Something went wrong. Try again.'
      }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: {
      error: false,
      message: 'Post deleted.'
    }
  end
  private
    def post_strong_params
      params.permit(
        :title,
        :description,
        :motive,
        :price,
        :image,
        :user_id,
        :product_id
      )
    end
end
