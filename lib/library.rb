require 'yaml'

class Library
  attr_accessor :books

  def list_available
    books.select { |obj| obj[:available] == true }
  end

  def list_all
    books.select { |obj| obj[:item]}
  end

  def books
    YAML.load_file('./lib/books.yml')
  end
end
