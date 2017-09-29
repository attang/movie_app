class HomesController < ApplicationController

	def index
    	@movielist = []	

        if params[:sort] == 'date'
            movies = Movie.all.order(release_date: :desc)
        elsif params[:sort] == 'genre'
            movies = Movie.all.order(genre: :asc)
        else
            movies = Movie.all.order(title: :asc)
        end

    	movies.each do |movie|
    		#find all reviews associated to the movie
    		reviews = Review.where(movie_id: movie.id).limit(3)
    		url = 'reviews/new/?id=' + movie.nk_movie_id.to_s + '&title=' + movie.title
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
