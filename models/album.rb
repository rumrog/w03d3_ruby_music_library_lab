require_relative('../db/sql_runner')
require_relative('./artist')

class Album

  attr_reader(:id, :artist_id)
  attr_accessor(:title, :genre )  

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    (
    title,
    genre,
    artist_id
    )
    VALUES
    (
    $1, $2, $3
    )
    RETURNING *"
    values = [@title, @genre, @artist_id]
    returned_array = SqlRunner.run(sql, values)
    album_hash = returned_array[0]
    id_string = album_hash['id']
    @id = id_string.to_i
    return @id
  end

  def self.list_all
    sql = "SELECT * FROM albums"
    returned_array = SqlRunner.run(sql)
    album_array = returned_array.map{|album_hash| Album.new(album_hash)}
    return album_array
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end
  
  def self.find_albums_by_artist(artist_name)
    # List all the albums by an artist
    artist_id = Artist.find(artist_name).id
    sql = "SELECT * FROM albums
    WHERE artist_id = $1"
    values = [artist_id]
    returned_array = SqlRunner.run(sql, values)
    album_array = returned_array.map{|album_hash| Album.new(album_hash)}
    return album_array
  end

  def self.find(title)
    sql = "SELECT * FROM albums
    WHERE title = $1"
    values = [title]
    results = SqlRunner.run(sql, values)
    return nil if results.first() == nil
    album_hash = results.first
    album = Album.new(album_hash)
    return album
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM albums
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return nil if results.first() == nil
    album_hash = results.first
    album = Album.new(album_hash)
    return album
  end

  def self.update()
    sql = "
    UPDATE albums SET (
      title,
      genre,
      artist_id
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@title, @genre, @artist_id, @id]
      SqlRunner.run(sql, values)
  end

end