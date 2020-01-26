class ProfileController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    email = params[:email]
    @users = User.where("email LIKE :q", q:"%#{email}%")
    if (@users.count == 1)
      @user = @users.first
      redirect_to show_profile_path(@user.id)
    end
  end

  def show
    @opinions = Opinion.where(user: @user).order('opinions.created_at DESC').page params[:page]
    @recommendations = Recommendation.where(user: @user).page params[:page]
    respond_to do |format|
      format.html { render :show }
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to show_profile_path(id: @user.id)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to show_profile_path(id: @user.id)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    # params.fetch(:user, {}).permit(:email)
    params.require(:user).permit(:email)
  end
end
