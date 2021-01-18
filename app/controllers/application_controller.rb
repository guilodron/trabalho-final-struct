class ApplicationController < ActionController::Base
  def homepage
    @latest = Movie.all.limit(5).order('created_at DESC').to_a
    @latest_first = @latest.shift
    @best_rated = Movie.all.limit(7).order('final_score DESC')
    @todos = User.all
  end
end
