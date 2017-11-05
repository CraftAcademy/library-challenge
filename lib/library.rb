require "yaml"

class Library

  attr_accessor :books

  def initialize
    @books = YAML.load_file("./lib/data.yml")
  end

private

  def record_available_books
  #  record_available_books
    available_books = collection.select { |obj| obj[:available] == true }
  #  books.each { |item| }
  #  if item[:available] == true
    available_books
  #  available_books[:author].to_s + ", " + available_books[:title]
  end

#  def checkout(book_id, person)
#  end


end
