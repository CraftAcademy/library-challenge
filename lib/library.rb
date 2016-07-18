require 'yaml'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def is_available?(title, author)
    book_id = get_book(title, author)
      if book_id == nil
        false
      else
        book_id[:available]
      end
  end

  def book_checkout(title, author)
    if is_available?(title, author)
      my_book = get_book(title, author)
      my_book[:available] = false
      { title: title, author: author, message: "item booked successfully" }
    else
      raise "This book is not available"
    end
  end

  private

  def get_book(title, author)
    books.detect { |obj| obj[:item][:title] == title and obj[:item][:author] == author }
  end
end
