class ApplicationController < ActionController::Base
  include Pagy::Backend
  
  def homepage
    @latest = Movie.all.limit(5).order('created_at DESC').to_a
    @final_scores = []
    @latest.each do |last|
      reviews = Review.where(movie_id: last.id)
      @final_scores << reviews.map{|review| review.score}.sum / reviews.count
    end
    @final_score_first = @final_scores.shift
    @latest_first = @latest.shift
    @best_rated = Movie.all.limit(7).order('final_score DESC')
    @todos = User.all
    
  end
end
