class TopSongs::CLI

    INPUT_HASH = {"hot 100": "THE HOT 1OO", "billboard 200": "BILLBOARD 2OO", "artist 100": "ARTIST 1OO", "emerging artists": "EMERGING ARTISTS", "top 40": "MAINSTREAM TOP 40", "rock": "HOT ROCK SONGS", "latin": "HOT LATIN SONGS", "hip hop": "HOT R&B/HIP-HOP SONGS", "dance": "HOT DANCE/ELECTRONIC SONGS", "country": "HOT COUNTRY SONGS", "all time": "GREATEST OF ALL TIME HOT 100 SONGS", "youtube": "YOUTUBE SONGS", "holiday": "HOLIDAY 100", "christian": "HOT CHRISTIAN SONGS", "japan": "JAPAN HOT 100"}

  def run
      TopSongs::Scraper.new
      puts "Welcome to the top songs according to Billboard 100!"
      menu
      puts INPUT_HASH.keys
      #take user input
      #scrape homepage for titles and
      input = nil

      while input != "exit"

        input = gets.chomp.downcase
        if input == "menu"
          menu

      elsif ["hot 100", "artist 100", "rock", "hip-hop", "hip hop"].include?(input)
          TopSongs::Chart.find_chart(input)
          #----------------WANTS
          #Another screen that says 'would you like to see the top 100 list?'
          #uses the charts object to grab url and print ordered list of songs

        else
          puts "Invalid input. Enter 'Menu' to see commands"
        end
      end
  end

  def menu
    puts "Please enter a command:
      Menu
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
    print "->"
  end

end
