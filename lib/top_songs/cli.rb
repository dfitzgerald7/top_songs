class TopSongs::CLI


  def run
      TopSongs::Scraper.new
      TopSongs::Chart.all.each do |c|
        c.print_songs
      end
      puts "Welcome to the top songs according to Billboard 100!"
      menu

      #take user input
      #scrape homepage for titles and
      input = nil
      while input != "exit"

        input = gets.chomp.downcase
        if input == "menu"
          menu

      elsif ["hot 100", "artist 100", "rock", "hip-hop", "hip hop"].include?(input)
          TopSongs::Chart.find_or_create(input)
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
