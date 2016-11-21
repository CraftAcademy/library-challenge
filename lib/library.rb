require 'yaml'

class Library
  # attr_accessor :available_books

  def initialize
    # @available_books = []
  end

  def list_available_books
    # load_books_database
    available_books = []
    collection = YAML.load_file('./lib/books_database.yml')
    available_items = collection.select { |obj| obj[:available] == true }
    available_items.each do |items|
        available_books << items[:item][:title]
    end
    return available_books
  end
end

#   private
#
#     def list_available_books
#       # collection = YAML.load_file('./lib/books_database.yml')
#     end
