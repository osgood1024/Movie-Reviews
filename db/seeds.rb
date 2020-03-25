#Destroys before seeding
Movie.destroy_all
Review.destroy_all
User.destroy_all
Watchlist.destroy_all

#gets genre based off of the passed in genre_id
def get_genre(genres, genre_id)
  genres.each do |genre|
    genre.each do |key, val|
      if key == "id"
        if val == genre_id
          return genre["name"]
        end
      end
    end
  end
end

api_key = ENV['SECRET_KEY']
#page number to retrive data from
page = 1
#Loops through max amount of pages

#Getting genre hash from movies database
resp = RestClient.get('https://api.themoviedb.org/3/genre/movie/list?api_key=4d53af2a0263d8997362e095ef2fc1d4&language=en-US')
data = JSON.parse(resp)
genres = data["genres"]

while page <= 500
  #Making the request to the movie database 
  resp = RestClient.get("https://api.themoviedb.org/3/movie/popular/?api_key=#{api_key}&language=en-US&page=#{page}")
  #parse 
  data = JSON.parse(resp)
  #setting the results to a variable 
  popular_movies_list = data["results"]
  #looping through the data to fill our movie database
  popular_movies_list.each do |movie|
      Movie.create({
        title: movie["title"],
        poster_path: movie["poster_path"],
        backdrop_path: movie["backdrop_path"],
        genre: get_genre(genres, movie["genre_ids"].first),
        overview: movie["overview"],
        release_date: movie["release_date"]
      })
  end
  #Increments to the next page
  page += 1
end

#Creats 20 dummy users
20.times do 
  User.create({
      name: Faker::Name.name_with_middle
  })
end

#Creates 40 dummy reviews
40.times do 
  Review.create({
    rating: Faker::Number.between(from: 1, to: 10),
    description: Faker::Hipster.paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 8),
    likes: Faker::Number.between(from: 1, to: 30),
    movie_id: Movie.all.sample.id,
    user_id: User.all.sample.id
  })
end

#Creates 30 dummy Watchlists
30.times do 
  Watchlist.create({
      movie_id: Movie.all.sample.id,
      user_id: User.all.sample.id
  })
end

