class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :score, presence: true
end
