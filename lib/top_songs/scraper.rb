class TopSongs::Scraper

  CHART_URL = "https://www.billboard.com/charts"

  def initialize
    self.class.scrape_chart(CHART_URL)

    #top charts
    #doc.css("a.charts-landing__link").text
    # doc.css("a.charts-landing__link").attr("href")

    #puts bottom charts
    # doc.css("div.charts-grid a").text
    #doc.css("div.charts-grid a").attr("href")



  end

  def self.scrape_chart(url)
    doc = Nokogiri::HTML(open(url))
    
  end

  def self.scrape_list(url)

  end

end
