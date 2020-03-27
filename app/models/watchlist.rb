class Watchlist < ApplicationRecord
	belongs_to :user 
	belongs_to :movie

	validates :movie_id, uniqueness: {scope: :user, message: " is already in your watchlist! Try other movies!"}



end
