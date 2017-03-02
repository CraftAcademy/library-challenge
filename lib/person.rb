require 'yaml'
require 'date'
require 'pry'

class Person

attr_accessor :books

def initialize
  @books = YAML.load_file('./lib/person.yml')
end

def perform_returnbook(item)
  book_return(item, available: false, return_date: '')
  return 'Book has been returned'
end

def perform_borrow(item)
  book_borrow(item, available: true, return_date: Date.today + 30)
end

private

def book_borrow(item, args)
  @books.detect do |item|
    if item[:item][:title] == item[:item][:title]
      item[:available] = args[:available]
      item[:return_date] = args[:return_date]
    end
  end
end

def book_return(item, args)
  @books.detect do |item|
    if item[:item][:title] == item[:item][:title]
      item[:available] = args[:available]
      item[:return_date] = args[:return_date]
    end
  end
end
end
