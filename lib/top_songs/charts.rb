class TopSongs::Charts
  attr_accessor :name, :url
  @@all = []


  def self.find_or_create(name)
    puts "find or create"
    # if self.all.find_by{|chart| }
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end
