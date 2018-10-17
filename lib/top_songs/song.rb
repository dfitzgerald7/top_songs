

class TopSongs::ListObject
  attr_accessor :artist, :title, :rank

  def initialize(title, artist, rank)
    self.title = title
    self.artist = artist
    self.rank = rank
  end

end
