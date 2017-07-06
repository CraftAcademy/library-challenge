require 'yaml'

class Library
  attr_accessor :books

  def initialize
    @books = load_item_info
  end
  def load_item_info
     YAML.load_file('./lib/books.yml')
  end
  def print_item_info(item)
    item[:title] + " " + "by" + " " + item[:author]
  end
  def available_book_list
    listed_books = available_books
    i = 0
    listed_books.each do |book_info|
      puts "*******************************************"
      puts print_item_info(book_info[:item])
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
  def find_available_book(title)
    available_book_list = available_books()
    available_book_list.find {|book| book[:item][:title] == title}
  end
  def checkout_book(person, title)
    book_to_check_out = find_available_book(title)
    unless book_to_check_out.nil?
      person.books << book_to_check_out[:item][:title]
      File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
    else
      puts "{@title} is not available"
    end

    # Update that the book is no longer available
    # Set a return date
    # Put the checked out book on person
  end
end
