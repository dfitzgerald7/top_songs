
#require gems
require "nokogiri"
require "open-uri"
require "pry"


#use for name spacing
module TopSongs
  # Your code goes here...
end


#Require files
require_relative "top_songs/version"
require_relative "top_songs/cli"
require_relative "top_songs/scraper"
require_relative "top_songs/chart"
require_relative "top_songs/list_object"
