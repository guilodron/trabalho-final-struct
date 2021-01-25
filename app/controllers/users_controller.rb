class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update, :my_reviews]

  def show
    @user = User.find(params[:id])
    @watched_movies = @user.movies
    @reviews = @user.reviews
  end

  def all_movies
    @pagy, @movies = pagy(Movie.all, items: 18)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(register_params)
    if @user.save!
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    begin
      @user.update!(user_params)
      redirect_to root_path
    rescue StandardError => e
      render 'edit'
    end
  end

  def my_reviews
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  private
  def register_params
    params.require(:user).permit(:email, :password, :user_name, :info, :favorite_genres)
  end

  def user_params
    params.require(:user).permit(:user_name, :info, :favorite_genres, :photo)
  end
end
