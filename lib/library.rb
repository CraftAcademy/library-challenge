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
  item [:title] + " " + "by" + " " + item [:author]
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
end
