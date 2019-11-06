# create files for your ruby classes in this directory


class Trip

    attr_reader :listing, :guest 
    @@all = [ ] 
    def initialize(listing, guest)
        @listing = listing
        @guest = guest
        @@all<<self
    end

    def self.all
        @@all
    end

end

