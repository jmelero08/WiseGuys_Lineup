class WiseGuysLineup::Locations 
    attr_accessor :name, :comics, :ref 

    @@all = []

    def initialize(name, ref)
        @name = name
        @ref = ref
        @comics = []
        save 
    end

    def self.all 
        WiseGuysLineup::Scraper.scrape_locations if @@all.empty?
        @@all 
    end

    def get_comics 
        WiseGuysLineup::Scraper.scrape_comics(self) if @comics.empty? 
    end

    def save
        @@all << self 
    end
end 