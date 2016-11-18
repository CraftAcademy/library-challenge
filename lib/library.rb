require 'yaml'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def search(book)
    @books.select{ |obj| obj[:item][:title].include? book }
  end

  def what_is_available?
    @books.select { |obj| obj[:available] == true }
  end
end
