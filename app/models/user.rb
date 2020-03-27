class User < ApplicationRecord
	has_many :reviews
	has_many :movies, through: :reviews
	has_many :watchlists
	has_many :movies, through: :watchlists

	validates :name, presence: true, uniqueness: true

	has_secure_password


	def list_watchlist
		self.watchlists.map {|watchlist| watchlist.movie.title}.last(3)
	end


end
