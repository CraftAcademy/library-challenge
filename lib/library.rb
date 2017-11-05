require "yaml"
require "date"

class Library

  CHECKOUT_DURATION = 1

  attr_accessor :books, :return_date

  def initialize
    @books = YAML.load_file("./lib/data.yml")
    @return_date = set_return_date
  end

#private

  def record_available_books
    available_books = books.select { |obj| obj[:available] == true }
    available_books.each { |obj| puts obj[:item][:title] + ", " + obj[:item][:author] }
  end

  def set_return_date
    Date.today.next_month(CHECKOUT_DURATION).strftime('%d/%m/%y')
  end

  def select_books_to_borrow(book, user = nil)
    detect_books = books.detect { |obj| obj[:item][:title] == book }
    if detect_books[:available] == true
      detect_books[:available] = false
      detect_books[:return_date] = self.set_return_date
      File.open('./lib/data.yml', 'w') { |f| f.write books.to_yaml }
      puts book + " has been borrowed and is due " + detect_books[:return_date]
    else
      puts "The book is not available"
    end
  end

end
