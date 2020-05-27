require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')
require_relative('sql_runner')


SqlRunner.run "SELECT * FROM albums"


# 2019
# What a Time to Be Alive ‡ 	Tom Walker
# When We All Fall Asleep, Where Do We Go? ‡ 	Billie Eilish
# Divinely Uninspired to a Hellish Extent ‡ 	Lewis Capaldi
# No.6 Collaborations Project ‡ 	Ed Sheeran
# Hollywood's Bleeding + Stoney ‡ 	Post Malone 

artist1 = Artist.new({"name" => "Tom Walker"})
artist2 = Artist.new({"name" => "Billie Eilish"})
artist3 = Artist.new({"name" => "Lewis Capaldi"})
artist4 = Artist.new({"name" => "Ed Sheeran"})
artist5 = Artist.new({"name" => "Post Malone"})

puts artist1.save

binding.pry
nil
