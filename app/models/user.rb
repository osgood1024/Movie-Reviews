class User < ApplicationRecord
	has_many :reviews
	has_many :movies, through: :reviews
	has_many :wishlists
	has_many :movies, through: :wishlists
end
