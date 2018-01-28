require 'yaml'

class Library

  attr_accessor :books

  def initialize
    @books = YAML::load_file(File.join(__dir__, 'data.yml'))
  end

  #LIST BOOKS
  def list_books
    @books.each do |items|
      book = items[:item][:title]
      author = items[:item][:author]
      available = items[:available]
      return_date = items[:return_date]

      #Checks parameter "available"
      items[:available] ? status = 'Available' : status = 'Checked out'
      #Returns a string with books
      "Book: #{book}, Author: #{author}, Is: #{status}"
      #puts "Book: #{book}, Author: #{author}, Available: #{status}"

    end
  end

  #SEARCH BOOKS
  # search for book dependent on their state
  def search_books_by_title(query, state)
    results = []
    search_result = @books.select { |items| items[:item][:title].include? query }
    search_result.each do |book|
      if state == book[:available]
        results << book
      elsif state == 'All'
        results << book
      end
      results
    end
  end

  #CHECKOUT BOOK
  def checkout_book(book)
    # is the book available?
    # does the person have overdue books on the bookshelf? 
  end

end
