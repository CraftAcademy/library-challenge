require 'yaml'
require 'date'
require 'pry'

class Library
  attr_accessor:catalog

  def initialize
    @catalog = YAML.load_file('./lib/data.yml')
  end

  def list_available_books
      available_books = @catalog.select { |item| item[:available] == true }
  end

  def find_title(title)
   @catalog.detect { |item| item[:item][:title] == title }
  end

  def takeout(wanted_book)
     return 'That book is not available' unless unavailable?(wanted_book)
       book = find_title(wanted_book)
       book[:available] = false
       book[:return_date] = Date.today + 30.days
       book
      end
  end

  def checkout_message
    case
    when checkout(book, person) then
      {status: true, message: 'To be returned by: ', date: Date.today + 30.days}
     else
      checked_out
     end
   end

   def checked_out
     @catalog.detect do |check|
       if check[:available] = false then
         {status: true, message: 'Sorry, this book is not available'}
    end
end
