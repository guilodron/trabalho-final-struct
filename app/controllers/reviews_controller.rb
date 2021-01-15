class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params.merge({user_id: params[:user_id], movie_id: params[:movie_id]}))
    begin
      @review.save!
    rescue StandardError => e
      flash[:alert] = e
    end
    redirect_to show_user_path(params[:user_id])
  end

  def update
    @review = Review.find(params[:id])
    begin
      @review.update!(review_params)
      rescue StandardError => e
      flash[:alert] = e
    end
    redirect_to show_movie_path(@review.movie.id)
  end

  def destroy
    @review = Review.find(params[:id])
    begin
      @review.destroy!
      flash[:alert] = 'Removido!'
    rescue StandardError => e
      flash[:alert] = e
    end
    redirect_to show_movie_path(@review.movie.id)
  end

  private
  def review_params
    params.require(:review).permit(:score, :comment)
  end
end