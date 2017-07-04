require 'yaml'

class Library
  attr_accessor :books

  def initialize
    @books = load_item_info
  end
  def load_item_info
     YAML.load_file('./lib/books.yml')
  end
  def print_item_info(item, item_number)
   "[" + item_number.to_s + "]" + item[:title] + " " + "by" + " " + item[:author]
  end
  def available_book_list
    listed_books = available_books
    i = 0
    listed_books.each do |book_info|
      puts "*******************************************"
      puts print_item_info(book_info[:item], i)
      i = i + 1
    end
    puts "*******************************************"
  end
  def available_books
    temp_books = []
    @books.each do |book_info|
      if book_info[:available] == true
        temp_books << book_info
      end
    end
    temp_books
  end
  def checkout_book(person, book_info)
    # Update that the book is no longer available
    # Set a return date
    # Put the book on the person yeah i cant
  end
end
