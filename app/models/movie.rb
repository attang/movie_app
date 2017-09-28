class Movie < ActiveRecord::Base
	has_many :review, dependent: :destroy
end
