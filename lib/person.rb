require './lib/library.rb'
require 'date'
require 'yaml'

class Person
    attr_accessor :name
    def initialize(name)
        @name = name
    end

def show_available_books
    collection = YAML.load_file('./lib/data.yml')
    collection.select { |obj| obj[:available] == true }
end

def search_book_by_title(title)
    books = show_available_books
    books.select { |obj| obj[:title] == title }
end

def search_book_by_author(author)
    books = show_available_books
    books.select { |obj| obj[:author].include? author }
end

def checkout_book(item)
    books = YAML.load_file('./lib/data.yml')
    case
    when books[item] == nil
        wrong_item_number
    when books[item][:borrowed_by] == @name
        already_borrowed
    when books[item][:available] == false
        book_not_available(item)
    else
        books[item][:available] = false 
        books[item][:return_date] = Date.today.next_day(STANDARD_RETURN_DAYS).strftime('%F')
        books[item][:borrowed_by] = @name
        File.open('./lib/data.yml', 'w') {|f| f.write books.to_yaml}
        return "You have borrowed #{books[item][:title]}. Please return it by #{books[item][:return_date]}"
    end
end

#Inspired by George and Zane on the sad path suggestions above#

private
def wrong_item_number
    return "You have entered an incorrect item number, please try another"
end

def book_not_available(item)
    books = YAML.load_file('./lib/data.yml')
    return "Book is not available until #{books[item][:return_date]}. Please come back then"
end

def already_borrowed
    return "You have already borrowed this book"
end

end
