require 'date'
require 'yaml'

class Library

  RETURN_DURATION = 1   # Value is in month

  attr_accessor :books, :borrowed_book

  def initialize

    @books = YAML.load_file('./lib/data.yml')

  end

  def books_instock
    @books.select { |book| book[:available] == true }
  end

  def book_available?(title, author)
    search_book(title, author)
  end

  def book_checkout(title, author)
    checkout(title,author)
  end

  def search_book(title, author)
    search(title, author)
  end

  private

  def search(title, author)
    @books.detect { |book| book[:item][:title] == title && book[:item][:author] == author }
  end

  def checkout(title, author)
    if book_available?(title, author)
      @borrowed_book = search_book(title, author)
      @borrowed_book[:available] = false
      @borrowed_book[:return_date] = set_return_date
      save_to_yaml() 
      {title: title, author: author, message: "Book successfully borrowed", :return_date => set_return_date}
    else
      raise "You can't borrow a book that is not available"
    end

  end

  def set_return_date
    today = Date.today
    next_month = today >> RETURN_DURATION
    due_date = next_month.strftime('%d/%m/%y')
    @borrowed_book[:return_date] = due_date
  end

  def save_to_yaml
    File.open('./lib/data.yml', 'w') do |update|
      update.write @books.to_yaml
    end
  end
end
