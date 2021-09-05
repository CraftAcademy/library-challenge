require 'yaml'
require 'date'

class Library
  attr_accessor :list_of_books

  def initialize
    @list_of_books = YAML.load_file('./lib/base_data.yml')
  end

  def search_for_title(title)
    list_of_books.select { |obj| obj[:book][:title].include? title }
  end

  def search_for_author(author)
    list_of_books.select { |obj| obj[:book][:author].include? author }
  end

  def list_available_books
    list_of_books.select { |obj| obj[:available] == true }
  end
end