require 'rails_helper'

RSpec.describe Review, :type => :model do
  subject { described_class.new(comment: "Ocean's Eleven is the best movie!", first_name: "Danny", last_name: "Ocean", email: "danny@gmail.com", rating: 5) }

  it "is valid with first_name, last_name, email, rating, and comment" do
  	expect(subject).to be_valid
  end

  it "is not valid without a first_name" do
  	subject.first_name = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without a last_name" do
  	subject.last_name = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
  	subject.email = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid with a bad email" do
  	subject.email = "bademail"
  	expect(subject).to_not be_valid
  end

  it "is not valid with a negative rating" do
  	subject.rating = -11
  	expect(subject).to_not be_valid
  end

  it "is not valid with a rating greater than five" do
  	subject.rating = 12
  	expect(subject).to_not be_valid
  end

  #Associations

  it "belongs to a movie" do
    assc = described_class.reflect_on_association(:movie)
    expect(assc.macro).to eq :belongs_to
  end
end