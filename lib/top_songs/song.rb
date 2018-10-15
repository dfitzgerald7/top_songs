

class TopSongs::Song
  attr_accessor :artist, :title, :rank

  def initialize(title, artist, rank)
    self.title = title
    self.artist = artist
    self.rank = rank
  end

  def print_list
    puts self.chart_name
    song_titles.each.with_index(1) {|song, index| puts "#{index}. #{song} by #{artists[index - 1]} "}
  end


end
