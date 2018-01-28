require 'yaml'
require 'date'
require 'person'

class Library

  attr_accessor :collection

  def initialize
    @collection = YAML.load_file('./lib/data.yml')
  end

  def search(title, author)
    @collection.detect { |book| book[:item][:title] == title and book[:item][:author] == author }
  end

  def check_out(title, author)
      #define a variable
      book = search(title, author)
      if does_not_exists?(book)
        return "This book is not in our catalogue."
      elsif is_not_available?(book)
        return "This book is not available."
      else
        check_out_book(book)
        return "Item successfully booked."
      end
  end

  def does_not_exists?(book)
    book == nil
  end

  def is_not_available?(book)
    book[:available] == false
  end

  def check_out_book(book)
    book[:available] = false
    book[:return_date] = return_date
  end

  def return_date
    Date.today.next_month(1).strftime("%m/%Y")
  end

end
