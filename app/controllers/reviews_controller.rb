class ReviewsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update]
  before_action :which_movie, only: [:new, :create ,:edit, :update]
  before_action :which_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params.merge({user_id: current_user.id, movie_id: @movie.id}))
    begin
      @review.save!
      redirect_to show_movie_path(@movie.id)
      rescue StandardError => e
      flash[:alert] = e
      redirect_to root_path
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
    begin
      @review.destroy!
      flash[:alert] = 'Removido!'
      redirect_to show_movie_path(@review.movie.id)
    rescue StandardError => e
      flash[:alert] = e
      redirect_to edit_review_path(@movie, @review)
    end

  end

  private
  def review_params
    params.require(:review).permit(:score, :comment)
  end

  def which_movie
    @movie = Movie.find(params[:id])
  end

  def which_review
    @review = Review.find(params[:review_id])
  end
end