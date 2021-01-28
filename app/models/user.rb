class User < ApplicationRecord
  authenticates_with_sorcery!
  has_one_attached :photo
  validates :email, :crypted_password, presence: true
  has_many :reviews
  has_many :movies, through: :reviews
  has_many :watcheds
  has_many :movies, through: :watcheds
end
