class WiseGuysLineup::Comics 
    attr_accessor :name, :location, :url   

    @@all = []

    def initialize(name, location, url)
        @name = name
        @location = location
        @url = url 
        add_to_location
        save 
    end

    def self.all
        @@all
    end

    def add_to_location
        @location.comics << self unless @location.comics.include?(self)
    end

    def save
        @@all << self 
    end
end 