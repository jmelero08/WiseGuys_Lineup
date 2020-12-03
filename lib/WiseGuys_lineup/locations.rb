class WiseGuysLineup::Locations 
    attr_accessor :name 

    @@all = []

    def initialize(name)
        @name = name
        save 
    end

    def self.all 
        WiseGuysLineup::Scraper.scrape_locations if @@all.empty?
        @@all 
    end

    def save
        @@all << self 
    end
end 