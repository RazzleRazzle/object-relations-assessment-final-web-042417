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
