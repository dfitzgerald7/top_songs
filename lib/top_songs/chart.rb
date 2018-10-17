
#Represents each chart on the homepage of Billboard 100
#has a name and a url so the list can be accessed thru chart

class TopSongs::Chart
  attr_accessor :name, :url, :list_objs, :is_songs
  @@all = []

  def initialize(name, url)
    self.name = name
    self.url = url
    self.list_objs = []
    if (self.name == "EMERGING ARTISTS" || self.name == "ARTIST 1OO")
      self.is_songs = false
    else
      self.is_songs = true
    end
    self.save
  end

  def self.find_chart(name)
      self.all.find{|c| c.name == name}.print_songs
  end

  def print_songs
    puts "\n#{self.name}
    \n"

    if self.is_songs == true
      self.list_objs.each do |song|
        puts "#{song.rank}. #{song.title} by #{song.artist}"
      end
    else
      self.list_objs.each do |song|
        puts "#{song.rank}. #{song.title}"
      end
    end
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end
