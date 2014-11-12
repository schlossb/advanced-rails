describe "Movie" do
  describe "model validations" do


it "should reject an empty title" do
   m = Movie.new(:title => '', :rating => 'G', :release_date => '1980-01-01')
   m.should_not be_valid
   m.errors[:title].should == ["can't be blank"]
end


it "should reject an invalid rating" do
   m = Movie.new(:title => '', :rating => 'Q', :release_date => '1980-01-01')
   m.should_not be_valid
   m.errors[:rating].should == ["must have a valid rating"]
end

it "should reject an empty rating" do
   m = Movie.new(:title => '', :release_date => '1980-01-01')
   m.should_not be_valid
   m.errors[:rating].should == ["must have a rating"]
end

it "should grandfather a movie older than 1968 with no rating" do
   m = Movie.new(:title => 'hallo', :release_date => '1960-01-01')
   m.should be_valid
end

it "should reject an empty date" do
   m = Movie.new(:title => '', :rating => 'R')
   m.should_not be_valid
   m.errors[:release_date].should == ["must have a release date"]
end

it "should reject a date older than 1930" do
   m = Movie.new(:title => '', :rating => 'R', :release_date => '1928-01-05')
   m.should_not be_valid
   m.errors[:release_date].should == ["must be released after 1930"]
end

end
end


