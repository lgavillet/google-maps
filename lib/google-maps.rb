require File.expand_path('../google-maps/configuration', __FILE__)
require File.expand_path('../google-maps/logger', __FILE__)
require File.expand_path('../google-maps/route', __FILE__)
require File.expand_path('../google-maps/place', __FILE__)
require File.expand_path('../google-maps/location', __FILE__)

module Google
  module Maps
    extend Configuration
    extend Logger
    
    def self.route(from, to)
      Route.new(from, to)
    end
    
    def self.distance(from, to)
      Route.new(from, to).distance.text
    end
    
    def self.duration(from, to)
      Route.new(from, to).duration.text
    end
    
    def self.places(keyword)
      Place.find(keyword)
    end

    def self.geocode(address, language = :en)
      Location.find(address, language)
    rescue ZeroResultsException
      []
    end
  end
end