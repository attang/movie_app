class Review < ActiveRecord::Base
	belongs_to :movie

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :rating, presence: true

	validates :email, :format => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  	validates :rating, inclusion: { in: 0..5 }
  	
end
