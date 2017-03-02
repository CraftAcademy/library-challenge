require 'yaml'
require 'date'
require 'pry'

class Person

attr_accessor :books

def initialize
  @books = YAML.load_file('./lib/person.yml')
end

def perform_returnbook(item)
  book_return(item, available: true)
  return 'Book has been returned'
end

private

def book_return(item, args)
  @books.detect do |item|
    if item[:item][:title] == item[:item][:title]
      item[:available] == args[:available]
    end
  end
end
end
