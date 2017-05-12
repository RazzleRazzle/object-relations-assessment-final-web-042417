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
