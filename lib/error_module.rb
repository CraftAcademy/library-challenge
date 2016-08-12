module Error

  def no_book_error
    raise 'Book not found'
  end

  def unreturnable_book_error
    raise 'Book cannot be returned'
  end

end
