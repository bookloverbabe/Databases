require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/album_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

artist_repository = ArtistRepository.new
album_repository = AlbumRepository.new

artist_repository.all.each do |artist|
  p artist
end

album_repository.all.each do |album|
  p album
end

album = album_repository.find(3)
puts album.id
puts album.title
puts album.release_year

repo = ArtistRepository.new

artist = Artist.new
artist.name = 'Florence + The Machine'
artist.genre = 'alternative'

repo.create(artist)
# INSERT INTO artists..
repo.delete(id)
# DELETE FROM artists where id =

artist = repo.find(1)
artist.name = 'Whatever'
repo.update(artist)

album = Album.new
album.title = 'Dance Fever'
album.release_year = 2022
album.artist_id = 1

repository.create(album)

all_albums = repository.all

# The all_albums array should contain the new Album object
# end