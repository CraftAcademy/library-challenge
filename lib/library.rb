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

  def return_date
    Date.today.next_month(1).strftime("%m,%y")
  end

  private

  def get_book(title, author)
    books.detect { |obj| obj[:item][:title] == title && obj[:item][:author] == author }
  end
end
