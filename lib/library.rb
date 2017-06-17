require 'yaml'

class Library
  attr_accessor :available_books, :taken_books

  def initialize
    @available_books = load_books_info
    @taken_books = []
  end
  def load_books_info
     YAML.load_file('./lib/books.yml')
  end
end
