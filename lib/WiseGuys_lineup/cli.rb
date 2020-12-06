class WiseGuysLineup::CLI
    def call
        puts "\nWelcome to WiseGuys Comedy Club!\n"
        @input = ""
        until @input == "exit"
            get_locations
            list_locations
            get_user_location
            done?
        end
        goodbye
    end

    def get_locations
        @locations = WiseGuysLineup::Locations.all 
    end
    
    def list_locations
        puts 'Choose location to see lineup.'
        @locations.each.with_index(1) do |location, index|
            puts "#{index}. #{location.name}"
        end 
    end

    def get_user_location
        chosen_location = gets.strip.to_i
        show_lineup_for(chosen_location) if valid_input(chosen_location, @locations)
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0 
    end

    def show_lineup_for(chosen_location)
        location = @locations[chosen_location - 1]
        location.get_comics 
        puts "Here are the comics for #{location.name}"
        location.comics.each.with_index(1) do |comic, index|
            puts "#{index}. #{comic.name}"
        end
        get_user_comic(location)
    end

    def get_user_comic(location)
        puts "Choose a comic to get more details."
        input = gets.strip
        comic = location.comics[input.to_i - 1]
        comic.get_comic_details
        show_comic_details(comic)
    end

    def show_comic_details(comic)
        puts comic.name
        comic.key_info.each {|i| puts "- #{i}"}
    end 
      
    def done?
        puts "Are you done? Type 'exit' to exit or hit any key to go back to locations."
        @input = gets.strip
    end 
      
    def goodbye
        puts "Enjoy The Show!"
    end 
end