require 'album_repository'

RSpec.describe AlbumRepository do
  def reset_albums_table
    seed_sql = File.read('spec/seeds_students.sql')
    connection = PG.connect({ host: '127.0.0.1', dname: 'students', user: 'postgres', password: ENV['DATABASE_PASSWORD']})
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_albums_table
  end
  
  it "returns two albums " do
    repo = AlbumRepository.new
    albums = repo.all

    expect(albums.length).to eq(2)
    expect(albums.first.title).to eq('Bossanova')
    expect(albums.first.release_year).to eq (1999)
    expect(albums.first.artist_id).to eq(1)
  end
# Return a single student with find method
  it 'returns a single student' do
    repo = AlbumRepository.new

    albums = repo.find(5) # The album repository class calls the find method. Using an id number to test the find methodrspec

    expect(album.id).to eq (5)
    expect(albums.first.title).to eq('title')
    expect(albums.first.release_year).to eq ('release_year')
    expect(albums.first.artist_id).to eq('artist_id')
  end
end