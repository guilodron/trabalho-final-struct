class WatchedsController < ApplicationController
  before_action :require_login

  def create
    user, movie = current_user, Movie.find(params[:id])
    @watched = Watched.new({user_id: user.id, movie_id: movie.id})
    if @watched.save!
      redirect_to show_movie_path(movie.id)
    else
      redirect_to root_path
    end

  end

end
