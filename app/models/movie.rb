class Movie < ActiveRecord::Base

  # the source marerial of the DVD, assuming pirated ;)
  # http://www.vcdq.com/index.php?page=faq
  SOURCES = %w(DVD-Rip R5 R5-Line DVD-Scr VHS-Scr R3 Telecine Telesync Cam)

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

  # all movies staring with the specified letter
  def self.find_by_first_letter(letter)
    self.all(:order => 'title ASC', :conditions => ['title LIKE ?', "#{letter}%"])
  end

  # the first letters of the movie titles with the number of movie titles sharing that first letter
  def self.first_letters_and_count
    sql = <<-SQL
      SELECT
        LCASE(SUBSTR(title, 1, 1)) AS letter,
        COUNT(title) AS count
      FROM
        movies
      GROUP BY
        letter ASC;
    SQL
    self.find_by_sql(sql);
  end

end
