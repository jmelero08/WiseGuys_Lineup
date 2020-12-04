class WiseGuysLineup::Locations 
    attr_accessor :name, :comics 

    @@all = []

    def initialize(name)
        @name = name
        @comics = []
        save 
    end

    def self.all 
        WiseGuysLineup::Scraper.scrape_locations if @@all.empty?
        @@all 
    end

    def get_comics 
        WiseGuysLineup::Scraper.scrape_comics(self) if @comics.empty?
        @comics 
    end

    def save
        @@all << self 
    end
end 