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
      puts "Book: #{book}, Author: #{author}, Is: #{status}"
      #puts "Book: #{book}, Author: #{author}, Available: #{status}"

    end
  end

  #SEARCH BOOKS
  def search_books(search_word, available)
    results = []
    search_result = @books.select { |items| items[:item][:title].include? search_word }
    search_result.each do |book|
      if available == book[:available]
      #puts "Book: #{book}"
      results << book
      elsif available == 'All'
      results << book
      end
      puts results
    end
  end

  #CHECKOUT BOOK
  def checkout_book(book)
  end

end
