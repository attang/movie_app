require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe "GET show" do
   before {@movie = Movie.create!(title: 'Best Movie', genre: 'Action', release_date: '2007-12-05', nk_movie_id: 22)}

    it "returns http success" do
      get :show, id: @movie
      expect(response).to have_http_status(:success)
    end
  end

end