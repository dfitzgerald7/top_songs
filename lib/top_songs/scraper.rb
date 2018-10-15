class TopSongs::Scraper

  CHART_URL = "https://www.billboard.com/charts"

  def initialize
    self.class.scrape_chart(CHART_URL)
    TopSongs::Chart.all.each do |chart|
      #binding.pry
      self.class.scrape_list(CHART_URL + chart.url, chart)
    end
  #  binding.pry

    #top charts
    #doc.css("a.charts-landing__link").text
    # doc.css("a.charts-landing__link").attr("href")

    #puts bottom charts
    # doc.css("div.charts-grid a").text
    #doc.css("div.charts-grid a").attr("href")



  end

  def self.scrape_chart(url)
    doc = Nokogiri::HTML(open(url))
    doc.css("a.charts-landing__link").each do |c|
      chart_name = c.text.strip.split("\n")[0]
      ref_url = c.attr("href").gsub("/charts", "")

      TopSongs::Chart.new(chart_name, ref_url)
    end
    doc.css("div.charts-grid a").each do |c|
      chart_name = c.text.strip.split("\n")[0]
      ref_url = c.attr("href")

      TopSongs::Chart.new(chart_name, ref_url)
    end

  end

  def self.scrape_list(url, chart)
    doc = Nokogiri::HTML(open(url))
    doc.css("div.chart-list-item").each do |song|
      song_arr = song.text.split("\n") - [""] - [" "]
      #binding.pry
      TopSongs::Song.new(song_arr[1], song_arr[2], song_arr[0]).tap {|song| chart.songs << song}
    end
    binding.pry
  end

end
