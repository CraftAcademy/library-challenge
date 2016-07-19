require 'yaml'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def available?(title, author)
    book_id = get_book(title, author)
      return false unless book_id
      book_id[:available]
  end

  def book_checkout(title, author)
    if available?(title, author)
      my_book = get_book(title, author)
      my_book[:available] = false
      { title: title, author: author, message: "item booked successfully" }
    else
      fail "This book is not available"
    end
  end

  private

  def get_book(title, author)
    books.detect { |obj| obj[:item][:title] == title && obj[:item][:author] == author }
  end
end
