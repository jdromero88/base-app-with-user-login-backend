class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create

  end

  def show
    # byebug
    @user = User.find_by(email: params[:email])
    @avatar = rails_blob_path(@user.avatar)
    if @user.authenticate(params[:password])
      puts('Password matched')
      render json: {user: @user, avatar: @avatar}
    else
      puts('wrong password')
      render json: {message: 'This user is not authenticated.'}
    end
  end

  def update

  end
end
