RSpec.describe ArtistRepository do
 
  def reset_albums_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dname: 'music_library_test', user: 'postgres', password: ENV['DATABASE_PASSWORD']})
    connection.exec(seed_sql)
  end
  before(:each) do
    reset_artists_table
  end
 
    it ' ' do
    repo = ArtistRepository.new
    artists = repo.all
    expect(artist.length).to eq (2)
    expect(artist.first.id).to eq ('1')
    expect(artist.first.name).to eq ('Pixies')
    expect(artist.length).to eq (2)
  end

  it 'create a new artist' do
    repo = ArtistRepository.new
    new_artist = Artist.new
    new_artist.name = 'Beatles'
    new_artist.genre = 'Pop'
    repo.create(new_artist)

    artists = repo.all
    last_artist = artists.last

    expect(last_artists.name).to eq('Beatles')
    expect(last_artists.genre).to eq('Pop')
  end

  it 'deletes artist with id 1' do
    repo = ArtistRepository.new
    id_to_delete = 1
    all_artists = repo.all
    expect(all_artists.length).to eq(1)
    expect(all_artists.first.id).to eq('2')
  end

  it 'deletes the two artists' do
    repo = ArtistRepository.new
    repo.delete(1)
    repo.delete(2)

    all_artists = repo.all
    expect(all_artists.length).to eq(0)
  end

  it 'updates the artist with a new name only' do
    repo = ArtistRepository.new
    artist = repo.find(1)

    artist.name = 'Something else'
    artist.genre = 'Disco'

    repo.update(artist)

    updated_artist = repo.find(1)

    expect(updated_artist.name).to eq('Something else')
    expect(updated_artist.genre).to eq('Disco')
  end
end