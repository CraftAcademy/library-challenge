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

  def select_books
    detect_books = books.select { |obj| obj[:item][:title].include? "Pippi" }
    detect_books.each { |obj| puts obj[:item][:title] + ", " + obj[:item][:author]  }
  end

end
