require 'yaml'
require 'person'

class Library
  STANDARD_VALIDITY_MONTH = 1
  attr_accessor :collection, :my_books

  def initialize
    @collection = YAML.load_file('./lib/data.yml')
  end

  def my_list
    book_list = []
    book_list = @collection.select { |obj| obj[:available] == true }
  end

  
end
