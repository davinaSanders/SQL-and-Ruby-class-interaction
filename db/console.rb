require("pry")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")

artist1 = Artist.new({"name" => "Joe"})
artist2 = Artist.new({"name" => "Davina"})
artist3 = Artist.new({"name" => "Luis"})

artist1.save()

album1 = Album.new({
  "title" => "Something",
  "genre" => "country",
  "artist_id" => artist1.id
  })
album2 = Album.new({
  "title" => "Like",
  "genre" => "pop",
  "artist_id" => artist1.id
  })
album3 = Album.new({
  "title" => "This",
  "genre" => "blues",
  "artist_id" => artist1.id
  })
