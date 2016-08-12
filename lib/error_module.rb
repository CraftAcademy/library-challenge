module Error_module

  def self.no_book_error
    raise 'Book not found'
  end

  def self.unreturnable_book_error
    raise 'Book cannot be returned'
  end

  def self.book_unavailable_error
    raise 'Book unavailable'
  end

  def self.search_failed_error
    raise 'Please enter a title or an author'
  end

  def self.no_books_found
    raise 'Your search returned no books'
  end

end
