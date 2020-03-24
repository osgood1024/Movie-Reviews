# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all
Review.destroy_all
User.destroy_all
Watchlist.destroy_all

20.times do 
    Movie.create({
      title: Faker::Book.title 
    })
  end


20.times do 
    User.create({
        name: Faker::Name.name_with_middle
    })
end

40.times do 
    Review.create({
      rating: Faker::Number.between(from: 1, to: 10),
      description: Faker::String.random(length: 30..60),
      likes: Faker::Number.between(from: 1, to: 30),
      movie_id: Movie.all.sample.id,
      user_id: User.all.sample.id
    })
  end


30.times do 
    Watchlist.create({
        movie_id: Movie.all.sample.id,
        user_id: User.all.sample.id
    })
    end





