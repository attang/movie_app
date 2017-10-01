class Movie < ActiveRecord::Base
	has_many :reviews, dependent: :destroy

	validates :release_date, presence: true
	validates :genre, presence: true
	validates :title, presence: true
	validates :nk_movie_id, presence: true
	
end
