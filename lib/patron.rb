require 'yaml'

class Patron
  attr_accessor :borrowed_books

  def initialize
    @borrowed_books = YAML.load_file('./lib/borrowed_books.yml')
  end
end
