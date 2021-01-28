class MoviesController < ApplicationController
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
    before_action :movie_score, only: [:show]
    
    def index    
      @pagy, @movies = pagy(Movie.filter(params[:search]), items: 18)
    end
  
    def show
      @movie = Movie.find(params[:id])
      # if @count != 0
      #   @movie.final_score = @f_score/@count
      # else
      #   @movie.final_score = nil
      # end
      # @movie.save!
    end
  
    def new
      @movie = Movie.new
    end
  
    def create
      movie = Movie.new(movie_params)
      begin
        movie.save!
        flash[:alert] = 'Filme adicionado!'
        redirect_to root
      rescue StandardError => e
        flash[:alert] = e
        redirect_to root_path
      end
    end
  
    def edit
      @movie = Movie.find(params[:id])
    end
  
    def update
      movie = Movie.find(params[:id])
      begin
        movie.update!(movie_params)
        redirect_to show_movies_path(movie.id)
        flash[:alert] = 'Atualizado!'
      rescue StandardError => e
        flash[:alert] = e
        redirect_to edit_movie_path(movie.id)
      end
    end
  
    def destroy
      movie = Movie.find(params[:id])
      begin
        movie.destroy!
        flash[:alert] = 'Removido!'
      rescue StandardError => e
        flash[:alert] = e
      end
      redirect_to index_movies_path
    end
  
    private
  
    def movie_params
      params.require(:movie).permit(:name, :release_date, :genres, :description, :director, :trailer, :photo)
    end

    def movie_score
      movie = Movie.find(params[:id])
      all_reviews = movie.reviews
      @f_score = 0
      @count = 0
      all_reviews.each do |s|
        if s.score != nil
          @count += 1
          @f_score += s.score
        end
      end
    end
  end
