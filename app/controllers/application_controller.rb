class ApplicationController < ActionController::Base
  def homepage
    @movies = Movie.order('created_at DESC').limit(5)
    @best_rated = Movie.order('final_score DESC').limit(5)
    @todos = User.all
  end
end
