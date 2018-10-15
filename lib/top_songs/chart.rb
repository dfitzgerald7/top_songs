
#Represents each chart on the homepage of Billboard 100
#has a name and a url so the list can be accessed thru chart

class TopSongs::Chart
  attr_accessor :name, :url, :songs, :is_songs
  @@all = []

  def initialize(name, url)
    self.name = name
    self.url = url
    self.songs = []
    if (self.name == "EMERGING ARTISTS" || self.name == "ARTIST 1OO")
      self.is_songs = false
    else
      self.is_songs = true
    end 
    self.save
  end

  def self.find_chart(name)
      self.find_by{|c| c.name == name}
  end

  def print_songs
    puts self.name
    puts ""
    if self.is_songs == true
      self.songs.each do |song|
        puts "#{song.rank}. #{song.title} by #{song.artist}"
      end
    else
      self.songs.each do |song|
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
