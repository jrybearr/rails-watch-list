require "json"
require "open-uri"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Movie.destroy_all
List.destroy_all

5.times do
  all_lists = List.new(
    name: Faker::Book.title
  )
  all_lists.save!

  all_movies = Movie.new(
    title: Faker::Movie.title,
    overview: Faker::Quote.matz,
    poster_url: Faker::LoremFlickr.image(search_terms: ['movies']),
    rating: Faker::Number.decimal(l_digits: 1, r_digits: 1)
  )
  all_movies.save!
end

# url = "http://tmdb.lewagon.com/movie/top_rated?language=en-US&page=1"
# response = URI.open(url).read
# movies = JSON.parse(response)
# results = movies["results"]
# p results

# results.each do |result|
#   all_movies = Movie.new(
#     title: result["title"],
#     overview: result["overview"],
#     poster_url: result["poster_path"],
#     rating: result["vote_average"]
#   )
#   all_movies.save!
# end
