require 'yaml'
require 'date'

class Library
    STANDARD_RETURN_DAYS = 30
    attr_accessor :collection, :available_books, :non_available_books
    def initialize
        @collection = YAML.load_file('./lib/data.yml')
        @available_books = show_available_books 
        @non_available_books = show_non_available_books
    end

def save_updates
    File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
end

def show_available_books
    collection.select { |obj| obj[:available] == true }
end

def show_non_available_books
    collection.select { |obj| obj[:available] == false  }
end

def select_book_by_title(title)
    collection.select { |obj| obj[:item][:title] == title }
end

def checkout_book(book)
    case
    when collection[book][:available] == false
        book_not_available(book)
    else
        collection[book][:available] = false 
        collection[book][:return_date] = Date.today.next_day(STANDARD_RETURN_DAYS).strftime('%F') 
        save_updates
        return "You have borrowed #{collection[book][:item][:title]}"
    end
end
end

private
def book_not_available(book)
    return "Book is not available until #{collection[book][:return_date]}. Please come back then"
end
