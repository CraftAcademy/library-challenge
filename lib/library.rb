require 'yaml'

class Library
  attr_accessor :available_books, :taken_books

  def initialize
    @available_books = load_item_info
    @taken_books = []
  end
  def load_item_info
     YAML.load_file('./lib/books.yml')
  end
  def print_item_info(item)
  item [:title] + " " + "by" + " " + item [:author]

  end

end
