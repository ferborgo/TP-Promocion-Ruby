class ProfileController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.where(email: params[:email])
    respond_to do |format|
      format.html { render :index }
    end
  end

  def show
    @opinions = Opinion.where(user: @user)
    respond_to do |format|
        format.html { render :show }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def params_permit
    params.permit(:email)
  end
end
