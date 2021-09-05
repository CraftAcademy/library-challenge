require './lib/library'
require 'yaml'

class Visitor
  attr_accessor :visitor_available_books, :collection

  def initialize(_attrs = {})
    @collection = YAML.load_file('./lib/data.yml')
  end

  def visitor_available_books
    YAML.load_file('./lib/data.yml').select { |book| book[:available] == true }
  end

  def book_return_date
    Date.today.next_month
  end

  def checkout_book(title)
    book = @collection.detect { |book| book[:item][:title] == title }
    # binding.pry
    if book[:available] == true
      book[:available] = false
      book[:return_date] = book_return_date
      return { message: 'Checkout of book success! Please return by:', date: Date.today.next_month }

    end
    File.open('./lib/data.yml', 'w') { |file| file.write collection.to_yaml }
  end
end
