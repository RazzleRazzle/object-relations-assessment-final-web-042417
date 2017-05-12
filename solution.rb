## MOVIE
class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.select {|t| t.title == title }
  end

  def ratings
    Rating.all.select do |t|
      t.movie == self.title
    end
  end

  def viewers
    self.ratings.collect {|t| t.viewer }
  end

  def average_rating
    ratings = []
    Rating.all.map do |e|
      if e.movie == self.title
        ratings << e.score
      end
    end
    (ratings.inject(0, :+) / ratings.length)
  end
end

##VIEWER
class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.select {|n| n.name == name}
  end

  def create_rating(score,movie)
    rating = Rating.new(self,movie,score)
  end

end

##RATING 
class Rating
  attr_accessor :score, :viewer, :movie
  @@all = []

  def initialize(viewer,movie,score)
    @viewer = viewer
    @movie = movie
    @score = score
    @@all << self
  end

  def self.all
    @@all
  end
end
