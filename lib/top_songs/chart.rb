
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
      self.all.find{|c| c.name == name}
  end

  def self.print_chart(name, input_num)
    #binding.pry
    self.find_chart(name).print_songs(input_num)
  end

  def print_songs(input_num)
    puts "\n#{self.name}
    \n"
    i = 0
    if self.is_songs == true
      input_num.times do
        puts "#{self.list_objs[i].rank}. #{self.list_objs[i].title} by #{self.list_objs[i].artist}"
        i += 1
      end
    else
      input_num.times do |song|
        puts "#{self.list_objs[i].rank}. #{self.list_objs[i].title}"
        i += 1
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
