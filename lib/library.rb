require 'yaml'

class Library

  attr_accessor :books

  def initialize

    @books = YAML.load_file('./lib/data.yml')

  end

  def book_available
    @books.select { |book| book[:available] == true}
  end
  
end
