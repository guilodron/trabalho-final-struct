class ReviewsController < ApplicationController
  #before_action :require_login
  before_action :which_movie
  before_action :which_review, only: [:edit, :update]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params.merge({user_id: current_user.id, movie_id: params[:movie_id]}))
    begin
      @review.save!
      redirect_to show_movie_path(params[@review.movie.id])
    rescue StandardError => e
      flash[:alert] = e
      render 'new'
    end
  end

  def edit
  end

  def update
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

  def which_movie
    @movie = Movie.find(params[:review_id])
  end

  def which_review
    @review = Review.find_by(user_id: User.last.id, movie_id: Movie.first.id)
  end
end