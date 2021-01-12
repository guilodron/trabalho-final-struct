class MoviesController < ApplicationController
    def index
      @movies = Movie.all
    end
  
    def show
      @movie = Movie.find(params[:id])
    end
  
    def new
      @movie = Movie.new
    end
  
    def create
      movie = Movie.new(movie_params)
      begin
        movie.save!
        flash[:alert] = 'Filme adicionado!'
        redirect_to index_movies_path
      rescue StandardError => e
        flash[:alert] = e
        redirect_to new_movie_path
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
      params.require(:movie).permit(:name, :release_date, :genres, :description, :director, :final_score, :trailers)
    end
  end
  