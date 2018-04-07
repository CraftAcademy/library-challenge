require 'yaml'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def books_available
    @books.select { |x| x[:available] == true }
  end

  def checkout(id, person)
    @books.detect { |x| x[:id] == id } =
  end

end
