class Movie < ActiveRecord::Base

  attr_accessible :title, :rating, :description, :release_date
  validates :title, presence: true
  validate :release_date, :valid_date
 # validates :rating, presence: true unless release_date.to_date < Date.parse("01-01-1968")
  validate :rating, :valid_rating
  validate :release_date, :valid_date

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def valid_rating
   if (release_date != nil && release_date.to_date < Date.parse("01-01-1968") )
      return true
   end
   if (rating == nil)
     errors.add(:rating, "must have a rating")
     return false
   end
   Movie.all_ratings.each do |validRating|
     if (rating == validRating)
       return true
     end
   end
      errors.add(:rating, "must have a valid rating")
      return false
  end

  def valid_date
   if (release_date == nil)
     errors.add(:release_date, "must have a release date")
     return false
   end

   if release_date.to_date > Date.parse("01-01-1930")
      return true
   end
     errors.add(:release_date, "must be released after 1930")
  end


end

