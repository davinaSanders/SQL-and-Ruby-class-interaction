require_relative("../db/sql_runner.rb")
require_relative("artist.rb")

class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map { |album| Album.new(album) }
  end

  def artist()
      sql = "SELECT * FROM artists WHERE id = $1"
      values = [@artist_id]
      results = SqlRunner.run(sql, values)
      artist_data = results[0]
      artist = Artist.new(artist_data)
      return artist
    end

    def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end


    def update()
      sql = "
      UPDATE albums SET
      (title,
        genre) =
      ($1,$2)
      WHERE id = $3"
      values = [@title, @genre, @id]
      SqlRunner.run(sql, values)
    end
end
