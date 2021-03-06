class TopSongs::Scraper

  CHART_URL = "https://www.billboard.com/charts"

  #put this in other method
  def self.scrape
    scrape_chart(CHART_URL)
    TopSongs::Chart.all.each do |chart|
      scrape_list(CHART_URL + chart.url, chart)
    end
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
      ref_url = c.attr("href").gsub("/charts", "")

      TopSongs::Chart.new(chart_name, ref_url)
    end

  end

  def self.scrape_list(url, chart)
    url = "https://www.billboard.com/charts/emerging-artists" if url == "https://www.billboard.com/charts/AAF"
    
    doc = Nokogiri::HTML(open(url))
    #binding.pry
    chart.list_objs << TopSongs::ListObject.new(doc.css(".chart-number-one__title").text.strip, doc.css(".chart-number-one__artist").text.strip, 1)

    doc.css("div.chart-list-item").each do |song|
      title = song.attr("data-title").strip
      artist = song.attr("data-artist").strip
      rank = song.attr("data-rank").strip
      #binding.pry
      TopSongs::ListObject.new(title, artist, rank).tap {|song| chart.list_objs << song}
    end

  end

end
