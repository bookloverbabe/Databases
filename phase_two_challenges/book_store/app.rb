require_relative 'lib/database_connection'
require_relative 'lib/books_repository'

# We need to give the database name to the method `connect`.
# For some reason I can only find the book_store table in the postgres database in Table plus, hwence why I'm using
# postgres in the brackets below.
DatabaseConnection.connect('postgres')

books_repository = BooksRepository.new

books_repository.all.each do |book|
  p book
end