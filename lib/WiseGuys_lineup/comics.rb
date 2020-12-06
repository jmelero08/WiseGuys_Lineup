class WiseGuysLineup::Comics 
    attr_accessor :name, :location, :url, :key_info   

    @@all = []

    def initialize(name, location, url)
        @name = name
        @location = location
        @url = url 
        @key_info = []
        add_to_location
        save 
    end

    def self.all
        @@all
    end

    def add_to_location
        @location.comics << self unless @location.comics.include?(self)
    end

    def get_comic_info
        WiseGuysLineup::Scraper.scrape_comic_info(self) if @key_info.empty?
    end 

    def save
        @@all << self 
    end
end 