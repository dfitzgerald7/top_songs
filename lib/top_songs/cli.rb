class TopSongs::CLI

    INPUT_HASH = {"hot 100" => "THE HOT 1OO", "billboard 200" => "BILLBOARD 2OO", "artist 100" => "ARTIST 1OO", "emerging artists" => "EMERGING ARTISTS", "pop" => "POP SONGS", "rock" => "HOT ROCK SONGS", "latin" => "HOT LATIN SONGS", "hip hop" => "HOT R&B/HIP-HOP SONGS", "dance" => "HOT DANCE/ELECTRONIC SONGS", "country" => "HOT COUNTRY SONGS", "all time" => "GREATEST OF ALL TIME HOT 100 SINGLES", "youtube" => "YOUTUBE SONGS", "holiday" => "HOLIDAY 100", "christian" => "HOT CHRISTIAN SONGS", "japan" => "JAPAN HOT 100"}

  def run
      puts "Loading ..."
      TopSongs::Scraper.scrape
      puts "Welcome to the top songs according to Billboard 100!"
      menu

      input = nil

      while input != "exit"
      print "Please enter command. Enter 'menu' to see chart list.\nEnter 'exit' to quit\n-> "
      input = gets.chomp.downcase
        if input == "menu"
          menu

        elsif INPUT_HASH.keys.include?(input)
          puts "To see entire list, enter 'total'"
          puts "Otherwise, enter the number of songs you would like to see."
          input2 = gets.chomp
          if input2 == "total"
            #binding.pry
            TopSongs::Chart.print_chart(INPUT_HASH[input], TopSongs::Chart.find_chart(INPUT_HASH[input]).list_objs.size)
          elsif TopSongs::Chart.find_chart(INPUT_HASH[input]).list_objs.size > input2.to_i
            TopSongs::Chart.print_chart(INPUT_HASH[input], input2.to_i)
          else
            puts "Invalid input."
          end

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
      Pop
      Rock
      Latin
      Hip-Hop
      Dance
      Country
      All Time
      Youtube
      Holiday
      Christian
      Japan"
  end

end
