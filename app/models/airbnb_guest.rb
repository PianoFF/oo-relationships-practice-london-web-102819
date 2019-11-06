class Guest
        attr_reader :name
        @@all = [ ] 
    def initialize (name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def trips#returns [ ] or guest instances
        Trip.all.select{|trip| trip.guest == self}
    end

    def listings
        trips.map{|trip| trip.listing}
    end

    def self.pro_travller
        @@all.select{|guest|guest.listings.size>1}
    end

    def find_all_by_name(name)
        @@all.select{|guest| guest.name == name}
    end
end