class UsersController < ApplicationController

before_action :set_user, only: [:follow,:unfollow,:follow_list,:follower_list]

  def index
    @users = User.order("provider DESC")
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
      current_user.follow(@user)
      redirect_to user_path(@user)
  end

  def unfollow
      current_user.stop_following(@user)
      redirect_to user_path(@user)
  end

  def follow_list
  end

  def follower_list
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :profile)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end
