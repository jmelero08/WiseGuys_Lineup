class WiseGuysLineup::Scraper
    def self.scrape_locations
        doc = Nokogiri::HTML(open("https://www.wiseguyscomedy.com/"))
        locations = doc.css("div.row.mt-md-5 h2")
        locations.each do |l|
            name = l.text
            WiseGuysLineup::Locations.new(name)
          end
    end
end