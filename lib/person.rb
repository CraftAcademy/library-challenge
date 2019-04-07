require './lib/library.rb'
require 'date'
require 'yaml'

class Person
    attr_accessor :name, :collection
    def initialize(name)
        @name = name
        @collection = YAML.load_file('./lib/data.yml')
    end

def save_updates
    File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
end

def show_available_books
    collection.select { |obj| obj[:available] == true }
end

def select_book_by_title(title)
    books = show_available_books
    books.select { |obj| obj[:item][:title] == title }
end

def checkout_book(book)
    case
    when collection[book][:available] == false
        book_not_available(book)
    else
        collection[book][:available] = false 
        collection[book][:return_date] = Date.today.next_day(STANDARD_RETURN_DAYS).strftime('%F')
        collection[book][:borrowed_by] = @name
        save_updates
        return "You have borrowed #{@collection[book][:item][:title]}. Please return it by #{@collection[book][:item][:return_date]}"
    end
end

private
def book_not_available(book)
    return "Book is not available until #{@collection[book][:return_date]}. Please come back then"
end

end
