require 'yaml'

class Library
  attr_accessor :available_books, :taken_books

  def initialize
    @available_books = available_books
    @taken_books = []
  end
  def load_books_info
    @available_books = YAML.load_file('some.yml')
  end
end
