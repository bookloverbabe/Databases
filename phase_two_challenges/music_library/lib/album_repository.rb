require_relative './album'
class AlbumRepository
  def all
    albums = []
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      album = Album.new
      album.id = record['id'].to_i
      album.title = record['title']
      album.release_year = record['release_year'].to_i
      album.artist_id = record['artist_id'].to_i

      albums << album
    end
    return albums
  end

  # Test-drive and implement the method find on the AlbumRepository class.
  # Modify the program in app.rb so it prints out to the terminal the data of the record with id 3, using the new method.

  def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;' # Set id here to $1, $1 is the placeholder for a parameter in SQL query.
    # Returns a single Student object.
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]

    album = Album.new
    album.id = record['id'].to_i
    album.title = record['title']
    album.release_year = record['release_year'].to_i
    album.artist_id = record['artist_id'].to_i
    
    return album
  end
  
  # Create a new album entry
  def create(album)
  # Execute the sql query
  # INSERT INTO albums
  # Doesn't need to return anything, just create a new record
  sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3);'
  sql_params = [album.title, album.release_year, album.artist_id]
  result_set = DatabaseConnection.exec_params(sql, sql_params)
  return nil
  end
end