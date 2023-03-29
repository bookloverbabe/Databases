require_relative './books'
class BooksRepository

  def all
    books = []
    sql = 'SELECT id, title, author_name FROM books;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |item|
      book = Books.new
      book.id = item['id']
      book.title = item['title']
      book.author_name = item['author_name']
      
      # This is to push each book element into the books array defined above
      books << book
    end
    # Returns an array of books objects.
    return books
  end
end