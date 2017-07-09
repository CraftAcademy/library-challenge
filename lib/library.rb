require 'yaml'

class Library
  attr_accessor :books

  def initialize
    @books = load_item_info
  end

  def load_item_info
     YAML.load_file('./lib/books.yml')
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
      book_to_check_out[:available] = false
      book_to_check_out[:return_date] = get_return_date()
      File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
      book_to_check_out
    else
      "{@title} is not available"
    end
  end

  def get_return_date
    Date.today.next_month(1).strftime("%Y-%m-%d")
  end

end
