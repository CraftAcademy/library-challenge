require 'yaml'
require 'date'

class Library
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
collection[book][:available] = false 
collection[book][:return_date] = Date.today.next_day(30).strftime('%F') 
save_updates
return "You have borrowed #{collection[book][:item][:title]}"

end
end