class UsersController < ApplicationController
  def index
    @users = User.all
    render json: UserSerializer.new(@users).to_serialized_json
  end

  def create
    # byebug
    @user = User.create!(user_strong_params)
    if @user
      render json: UserSerializer.new(@user).to_serialized_json
    else
      render json: {
        error: true,
        message: 'Email already in use. Try a different one.'
      }, status: :not_acceptable
    end
  end

  def show
    # byebug
    @user = User.find_by(email: params[:email])
    @avatar = rails_blob_path(@user.avatar)
    if @user.authenticate(params[:password])
      # puts('Password matched')
      render json: {user: @user, avatar: @avatar}
    else
      # puts('wrong password')
      render json: {message: 'This user is not authenticated.'}
    end
  end

  def update
    # byebug
    @user = User.find(params[:id])
    @user.update(avatar: params[:avatar])
    @avatar_url = rails_blob_path(@user.avatar)
    # byebug
    render json: { user: @user, avatar_url: @avatar_url}
  end

  private
    def user_strong_params
      params.permit(
        :user,
        :first_name,
        :last_name,
        :email,
        :password,
        :bio
      )
    end
end
