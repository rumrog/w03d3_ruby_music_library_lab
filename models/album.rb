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
  
end