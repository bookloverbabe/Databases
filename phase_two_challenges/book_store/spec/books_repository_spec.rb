require 'books_repository'

RSpec.describe BooksRepository do
  def reset_books_table
    seed_sql = File.read('spec/seeds_book_store.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'students', user: 'postgres', password: ENV['DATABASE_PASSWORD']})
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_books_table
  end
  # (your tests will go here).
  it "returns two books" do
    repo = Booksrepository.new
    books = repo.all
    
    expect(books.length).to eq(3)
    expect(albums.first.title).to eq('Wanderers')
    expect(albums.first.id).to eq(1)
  end
end