class WiseGuysLineup::CLI
    def call
        puts 'Welcome to WiseGuys Comedy Club!'
        get_locations
        get_user_location
        #get_comics_for(location)
        #list_comics
    end

    def get_locations
        #can be scrapped instead
        @locations = ['Ogden', 'Salt_Lake_City', 'Jordan_Landing']
    end
    
    def get_user_location
        @locations.each_with_index do |location, index|
            puts "#{index + 1}. #{location}"
        end 
    end
end 