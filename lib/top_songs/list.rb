

class TopSongs::List
  attr_accessor :artists, :song_titles, :chart_name

  def initialize(chart_name)
    self.chart_name = chart_name
    self.artists = []
    self.song_titles = []
  end

  def print_list
    puts self.chart_name
    song_titles.each.with_index(1) {|song, index| puts "#{index}. #{song} by #{artists[index - 1]} "}
  end


end
