require "yaml"

class Library

  attr_accessor :books

  def initialize
    @books = YAML.load_file("./lib/data.yml")
  end

  def record_available_books
  #  record_available_books
    books.each {|key, value| }
    available: true
    print books[:author] + [:title]
  end

  def checkout(book_id, person)

  end


end
