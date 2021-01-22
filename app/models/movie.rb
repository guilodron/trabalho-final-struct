class Movie < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_one_attached :photo

  def self.filter(search)
    if search and search != 'Todos'
      movies = Movie.where(genres: search)
      return movies
    else 
      Movie.all
    end
  end
end
