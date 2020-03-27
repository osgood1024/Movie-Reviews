class Review < ApplicationRecord
	belongs_to :user 
	belongs_to :movie


	validates :rating, :inclusion => { :in => 1..10, :message => " should be between 1 to 10" }
	validates :rating, :presence => { :message => " cannot be blank" }

	validates :likes, :inclusion => { :in => 1..10, :message => " should be between 1 to 10" }
	validates :likes, :presence => { :message => " cannot be blank" }

	validates :description, :presence => { :message => " cannot be blank" }

end