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
    expect(artists.length).to eq (2)
    expect(artists.first.id).to eq ('1')
    expect(artists.first.name).to eq ('Pixies')
    expect(artists.length).to eq (2)

  end
end