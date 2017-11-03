require 'yaml'

class Library
  attr_accessor :book_list

  def initialize
    @book_list = YAML.load_file('./lib/book_collection.yml')
  end
end
