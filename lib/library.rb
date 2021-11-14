require "yaml"

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file("./lib/data.yml")
  end

  def search_book_title
  end

  def search_book_author
    books.select { |obj| obj[:book][:author].include? "Moberg" }
  end

  def checkout_book
  end

  def search_result
  end
end
