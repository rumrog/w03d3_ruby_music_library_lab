require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')
require_relative('sql_runner')


SqlRunner.run "SELECT * FROM albums"

Album.delete_all
Artist.delete_all

# What a Time to Be Alive ‡ 	Tom Walker
# When We All Fall Asleep, Where Do We Go? ‡ 	Billie Eilish
# Divinely Uninspired to a Hellish Extent ‡ 	Lewis Capaldi
# No.6 Collaborations Project ‡ 	Ed Sheeran
# Hollywood's Bleeding + Stoney ‡ 	Post Malone 

artist1 = Artist.new({"name" => "Tom Walker"})
artist1_id = artist1.save
artist2 = Artist.new({"name" => "Billie Eilish"})
artist2_id = artist2.save
artist3 = Artist.new({"name" => "Lewis Capaldi"})
artist3_id = artist3.save
artist4 = Artist.new({"name" => "Ed Sheeran"})
artist4_id = artist4.save
artist5 = Artist.new({"name" => "Post Malone"})
artist5_id = artist5.save

album1 = Album.new({
    "title" => "What a Time to Be Alive",
    "genre" => "Rock",
    "artist_id" => artist1_id
})
album1_id = album1.save

album2 = Album.new({
    "title" => "When We All Fall Asleep, Where Do We Go?",
    "genre" => "Rock",
    "artist_id" => artist2_id
})
album2_id = album2.save

album3 = Album.new({
    "title" => "Divinely Uninspired to a Hellish Extent",
    "genre" => "Rock",
    "artist_id" => artist3_id
})
album3_id = album3.save

album4 = Album.new({
    "title" => "No.6 Collaborations Project",
    "genre" => "Rock",
    "artist_id" => artist4_id
})
album4_id = album4.save

album5 = Album.new({
    "title" => "Hollywood's Bleeding",
    "genre" => "Rock",
    "artist_id" => artist5_id
})
album5_id = album5.save
album6 = Album.new({
    "title" => "Stoney",
    "genre" => "Rock",
    "artist_id" => artist5_id
})
album6_id = album6.save

# puts artist1.save
# puts album1.save

binding.pry
nil
