require 'yaml'
require 'date'
require 'pry'

class Person

attr_accessor :books

def initialize
  @books = YAML.load_file('./lib/person.yml')
end

def perform_returnbook(title)
  book_return(title, available: false, return_date: '')
  # File.open('./lib/person.yml', 'w') { |f| f.write @books.to_yaml }
  return 'Book has been returned'
end

def perform_borrow(title)
  book_borrow(title, available: true, return_date: Date.today + 30)
  # File.open('./lib/person.yml', 'w') { |f| f.write @books.to_yaml }
end

private

def book_borrow(title, args)
  @books.detect do |x|
    if x[:item][:title] == title
      x[:available] = args[:available]
      x[:return_date] = args[:return_date]
    end
  end
end

def book_return(title, args)
  @books.detect do |x|
    if x[:item][:title] == title
      x[:available] = args[:available]
      x[:return_date] = args[:return_date]
    end
  end
end
end
