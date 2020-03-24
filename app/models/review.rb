class Review < ApplicationRecord
	belongs_to :user 
	belongs_to :movie

	validates :rating, length: {in: 1..10}
end
