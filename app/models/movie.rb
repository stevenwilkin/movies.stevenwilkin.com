class Movie < ActiveRecord::Base

  # the source marerial of the DVD, assuming pirated ;)
  # http://www.vcdq.com/index.php?page=faq
  SOURCES = %w(DVD-Rip R5 R5-Line DVD-Scr VHS-Scr)

  # title must be present and unique
  validates_presence_of :title
  validates_uniqueness_of :title

  # source must correspond to an entry in SOURCES
  validates_inclusion_of :source, :in => 0..SOURCES.length-1

  # a hash of letters => arrays of movies beginning with that leter
  def self.all_grouped_by_first_letter
    @movies = {}
    self.all(:order => 'title ASC').each do |movie|
      (@movies[movie.title.first.downcase] ||= []).push(movie)
    end
    @movies
  end

end
