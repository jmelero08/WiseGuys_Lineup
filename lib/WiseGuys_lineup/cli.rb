class WiseGuysLineup::CLI
    def call
        puts "\nWelcome to WiseGuys Comedy Club!\n"
        get_locations
        list_locations
        get_user_location
        #get_comics_for(location)
        #list_comics
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
    end
end 