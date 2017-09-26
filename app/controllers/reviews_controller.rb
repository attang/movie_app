class ReviewsController < ApplicationController
  def new
  	movie_id = params[:movie_id]
  	@review = Review.new(movie_id: movie_id)
  end

  def create
  	review = Review.new(review_params)

  	if not Movie.find_by_movie_id(review.movie_id)
  		#pull the movie information and store it locally
  		
  	end

  	if review.save
		flash[:notice] = "Successfully made a review"
		redirect_to root_path
	else
		render :action => 'new'
	end
  end

  def show

  end

  private

  def review_params
  	params.require(:review).permit(:first_name, :last_name, :email, :rating, :comment, :movie_id)
  end

end
