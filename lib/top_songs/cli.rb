class TopSongs::CLI

    INPUT_HASH = {"hot 100" => "THE HOT 1OO", "billboard 200" => "BILLBOARD 2OO", "artist 100" => "ARTIST 1OO", "emerging artists" => "EMERGING ARTISTS", "top 40" => "MAINSTREAM TOP 40", "rock" => "HOT ROCK SONGS", "latin" => "HOT LATIN SONGS", "hip hop" => "HOT R&B/HIP-HOP SONGS", "dance" => "HOT DANCE/ELECTRONIC SONGS", "country" => "HOT COUNTRY SONGS", "all time" => "GREATEST OF ALL TIME HOT 100 SONGS", "youtube" => "YOUTUBE SONGS", "holiday" => "HOLIDAY 100", "christian" => "HOT CHRISTIAN SONGS", "japan" => "JAPAN HOT 100"}

  def run
      puts "Loading ..."
      TopSongs::Scraper.scrape
      puts "Welcome to the top songs according to Billboard 100!"
      menu

      #take user input
      #scrape homepage for titles and
      input = nil

      while input != "exit"
      print "Please enter command. Enter menu to see chart list.\n-> "
      input = gets.chomp.downcase
        if input == "menu"
          menu

        elsif INPUT_HASH.keys.include?(input)
          TopSongs::Chart.find_chart(INPUT_HASH[input])

        elsif input == "exit"
          puts "Goodbye!"
        else
          puts "Invalid input. Please try again."
        end
      end
  end

  def menu
    puts "Please choose a chart:
      Hot 100
      Billboard 200
      Artist 100
      Top 40
      Rock
      Latin
      Hip-Hop
      Dance
      Country
      All Time
      Youtube
      Holiday
      Christian
      Japan
      Exit"

  end

end
