require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

guest1=Guest.new ("Monica")
guest2=Guest.new ("Ross")
guest3=Guest.new ("Chandler")
guest4=Guest.new ("Cade")

listing1 = Listing.new("Philadelphia")
most_popular_listing = Listing.new("London")
listing3 = Listing.new("Chicago")
listing4 = Listing.new("New Jersey")
 
most_popular = Listing.most_popular
puts "If you see London, #{most_popular} works" 

Trip.new(listing4, guest3)
Trip.new(most_popular_listing, guest1)
Trip.new(most_popular_listing,guest3)
Trip.new(listing3,guest2)
Trip.new(listing3,guest4)
Trip.new(most_popular_listing,guest4)
Trip.new(listing1,guest4)

binding.pry
0