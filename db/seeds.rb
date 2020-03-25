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



#Making the request to the movie database 
resp = RestClient.get("https://api.themoviedb.org/3/movie/popular/?api_key=#{API_KEY}&language=en-US&page=1")
#parse 
data = JSON.parse(resp)

popular_movies_list = data["results"]


 
popular_movies_list.each do |movie|
  movie.each do |key, val|
    if key == "title"
      Movie.create({
        title: val
      })
    end
  end
end




