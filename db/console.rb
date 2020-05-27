require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')
require_relative('sql_runner')


SqlRunner.run "SELECT * FROM albums"

Album.delete_all
Artist.delete_all

# 2019
# What a Time to Be Alive ‡ 	Tom Walker
# When We All Fall Asleep, Where Do We Go? ‡ 	Billie Eilish
# Divinely Uninspired to a Hellish Extent ‡ 	Lewis Capaldi
# No.6 Collaborations Project ‡ 	Ed Sheeran
# Hollywood's Bleeding + Stoney ‡ 	Post Malone 

artist1 = Artist.new({"name" => "Tom Walker"})
artist1_id = artist1.save
artist2 = Artist.new({"name" => "Billie Eilish"})
artist3 = Artist.new({"name" => "Lewis Capaldi"})
artist4 = Artist.new({"name" => "Ed Sheeran"})
artist5 = Artist.new({"name" => "Post Malone"})

album1 = Album.new({
    "title" => "What a Time to Be Alive",
    "genre" => "Rock",
    "artist_id" => artist1_id
})
album1.save

# puts artist1.save
# puts album1.save

binding.pry
nil
