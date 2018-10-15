
#Represents each chart on the homepage of Billboard 100
#has a name and a url so the list can be accessed thru chart

class TopSongs::Chart
  attr_accessor :name, :url, :songs
  @@all = []

  def initialize(name, url)
    self.name = name
    self.url = url
    self.songs = []
    self.save
  end

  def self.find_chart(name)
      self.find_by{|c| c.name == name}
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end
