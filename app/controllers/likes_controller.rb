class LikesController < ApplicationController
  before_action :find_opinion
  before_action :find_like, only: [:destroy]
  before_action :authenticate_user!
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @opinion.likes.create(user_id: current_user.id)
    end
    redirect_to book_url(@opinion.book)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to book_url(@opinion.book)
  end

  private
  def find_opinion
   @opinion = Opinion.find(params[:opinion_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, opinion_id: params[:opinion_id]).exists?
  end

  def find_like
     @like = @opinion.likes.find(params[:id])
  end
end
