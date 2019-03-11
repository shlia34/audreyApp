class UsersController < ApplicationController

  def index
    @users = User.order("name ASC")
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @likes = @user.likes.order("created_at DESC").page(params[:page]).per(8)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def follow
      @user = User.find(params[:user_id])
      current_user.follow(@user)
      redirect_to user_path(@user)
  end

  def unfollow
      @user = User.find(params[:user_id])
      current_user.stop_following(@user)
      redirect_to user_path(@user)
  end

  def follow_list
    @user = User.find(params[:user_id])
  end

  def follower_list
    @user = User.find(params[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :profile)
  end

end
