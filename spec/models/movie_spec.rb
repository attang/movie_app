require 'rails_helper'

RSpec.describe Movie, :type => :model do
  subject { described_class.new(release_date: "2003-07-09", genre: "Action", title: "Best Movie", nk_movie_id: 1) }

  it "is valid with a release date, genre, title, and natural movie key" do
  	expect(subject).to be_valid
  end

  it "is not valid without a release_date" do
  	subject.release_date = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without a genre" do
  	subject.genre = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without a title" do
  	subject.title = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without a natural key for the movie id" do
  	subject.nk_movie_id = nil
  	expect(subject).to_not be_valid
  end

  #Associations

  it "has many reviews" do
    assc = described_class.reflect_on_association(:reviews)
    expect(assc.macro).to eq :has_many
  end

end