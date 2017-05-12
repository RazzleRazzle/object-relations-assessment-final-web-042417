require 'pry'
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
