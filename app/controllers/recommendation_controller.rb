class RecommendationController < ApplicationController

  def create
    @recommendation = Recommendation.new
    @recommendation.book = Book.find(params[:book_id])
    @recommendation.user = current_user
    if (params[:text])
      @recommendation.text = params[:text]
    end
    @recommendation.save
    
    redirect_to book_path(params[:book_id])
  end

  def delete
    @recommendation = Recommendation.find(params[:id])
    if (@recommendation)
      @recommendation.destroy
      redirect_to show_profile_path(current_user.id)
    else
      logger.debug('lala')
    end
  end
end
