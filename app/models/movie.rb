class Movie < ApplicationRecord
	has_many :reviews
	has_many :users, through: :reviews
	has_many :watchlists
	has_many :users, through: :watchlists
end
