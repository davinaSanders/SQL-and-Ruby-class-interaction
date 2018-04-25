require_relative("../db/sql_runner.rb")
require_relative("album.rb")

class Artist
  attr_reader :id
  attr_accessor :name
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end


  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    artist_array = artists.map { |artist| Artist.new(artist) }
    return artist_array
  end

end
