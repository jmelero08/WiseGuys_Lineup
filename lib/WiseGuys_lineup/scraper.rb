class WiseGuysLineup::Scraper
    def self.scrape_locations
        doc = Nokogiri::HTML(open("https://www.wiseguyscomedy.com/"))
        locations = doc.css('div.row.mt-md-5 a')
        locations.each do |l|
            name = l.css('h2').text
            ref = l.attr('href')
            WiseGuysLineup::Locations.new(name, ref)
          end
    end

    def self.scrape_comics(location)
        url = "https://www.wiseguyscomedy.com#{location.ref}"
        doc = Nokogiri::HTML(open(url))
        comics = doc.css("div.row.event-catalog a") 
        comics.each do |c|
            name = c.css('span.event-summary_title').text
            url = c.attr('href')
            WiseGuysLineup::Comics.new(name, location, url)
        end
    end

    def self.scrape_key_info(comic)
        url = "https://www.wiseguyscomedy.com#{comic.url}"
        doc = Nokogiri::HTML(open(url))
        info = doc.css("p.description.d-none")
        info.each do |i|
          info = i.text.strip
          comic.key_info << info
        end 
    end
end