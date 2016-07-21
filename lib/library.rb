require 'yaml'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  RETURN_DATE = 1

  def available?(title, author)
    book_id = get_book(title, author)
      return false unless book_id
      book_id[:available]
  end

  def book_checkout(title, author)
    if available?(title, author)
      my_book = get_book(title, author)
      my_book[:available] = false
      { title: title, author: author, message: "item booked successfully", return_date: set_return_date(my_book) }
    else
      fail "This book is not available"
    end
  end

  def available_books
    list = @books.select { |item| item[:available] == true }
  end

  private

  def get_book(title, author)
    books.detect { |obj| obj[:item][:title] == title && obj[:item][:author] == author }
  end

  def set_return_date(booked_item)
    booked_item[:return_date] = Date.today.next_month(RETURN_DATE).strftime('%d/%m/%y')
    booked_item[:return_date]
  end

end
