class HomesController < ApplicationController

	def index
    	@movielist = []	

    	movies = Movie.all.limit(5)
    	movies.each do |movie|
    		#find all reviews associated to the movie
    		reviews = Review.where(movie_id: movie.id).limit(3)
    		url = 'reviews/new/?id=' + movie.nk_movie_id.to_s
    		@movielist << [movie, url, reviews]
    	end

    	@reviewlist = []
    	reviews = Review.all.limit(10)
    	reviews.each do |review|
    		#find movie title associated to review
    		title = Movie.find_by_id(review.movie_id).title
    		@reviewlist << [review, title]
    	end
	end

end
