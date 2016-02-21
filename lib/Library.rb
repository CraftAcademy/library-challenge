class Library
  attr_accessor :list_of_books

  def initialize(options={})
      @list_of_books = options[:list_of_books] || []
  end

 def Add_new_book(book)
   {
     title: book[:title],
     author: book[:author],
     book_status: :okay,
     person: :non,
     return_date: " "
  }
 end
