require 'yaml'

class Library

  attr_accessor :books

  def initialize

    @books = YAML.load_file('./lib/data.yml')

  end

  def book_available
    @books.select { |book| book[:available] == true}
  end

def search(title,author)
  search_book(title,author)
end


private

  def search_book(title, author)

    @books.detect { |book| book[:item][:title] == title && book[:item][:author] == author }
  end
end
