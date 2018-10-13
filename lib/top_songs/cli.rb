class TopSongs::CLI


  def run
      puts "Welcome to the top songs according to Billboard 100!"
      menu
      #take user input
      #scrape homepage for titles and
      input = nil
      while input != "exit"

        input = gets.chomp.downcase
        if input == "menu"
          menu
        # elsif input == "hot 100"
        #   TopSongs::Charts.find_or_create("Hot 100")
        # elsif input == "artist 100"
        #   TopSongs::Charts.find_or_create("Artist 100")
        # elsif input == "rock"
        #   TopSongs::Charts.find_or_create("Rock")
        # elsif input == "hip-hop" || "hip hop"
        #   TopSongs::Charts.find_or_create("Hip-Hop")

      elsif ["hot 100", "artist 100", "rock", "Hip-Hop", "Hip Hop"].include?(input)
          TopSongs::Charts.find_or_create(input)
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
      Artist 100
      Rock
      Hip-Hop
      Exit"
    print "->"
  end

end
