require 'yaml'

class Library

  attr_accessor :books

  def initialize(books)
    @books = YAML.load_file('./lib/data.yml')
  end

  def all_books
   @books
  end

  def available_books
    @books.select { |obj| obj[:available] == true  }
  end
end
