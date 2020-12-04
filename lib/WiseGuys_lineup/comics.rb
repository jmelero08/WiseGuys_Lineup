class WiseGuysLineup::Comics 
    attr_accessor :name, :location   

    @@all = []

    def initialize(name, location)
        @name = name
        @location = location
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