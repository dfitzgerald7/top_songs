class TopSongs::Scraper

  def self.scrape_chart(url)
    doc = Nokogiri::HTML(open(url))
  end

  def self.scrape_list(url)

  end

end
