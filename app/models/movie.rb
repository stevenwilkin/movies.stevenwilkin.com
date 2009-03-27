class Movie < ActiveRecord::Base

  validates_uniqueness_of :title

  # a hash of letters => arrays of movies beginning with that leter
  def self.all_grouped_by_first_letter
    @movies = {}
    self.all(:order => 'title ASC').each do |movie|
      (@movies[movie.title.first.downcase] ||= []).push(movie)
    end
    @movies
  end

end
