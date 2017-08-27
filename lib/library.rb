require 'yaml'
require 'date'
require './lib/patron.rb'

class Library
  attr_accessor :collection

  def initialize
    @collection = YAML.load_file('./lib/data.yml')
  end

  def available?(title, author)
    book_id = @collection.detect { |obj| obj[:item][:title] == title && obj[:item][:author] == author }
    if book_id == nil
      false
    else
      book_id[:available]
    end
  end

  def book_checkout(title, author)
    if available?(title, author)
      { message: "Successfully booked an item" }
    else
      { message: "Book not available" }
    end
  end

  def return_date
    Date.today.next_month(1).strftime("%d,%m,%y")
  end

end
