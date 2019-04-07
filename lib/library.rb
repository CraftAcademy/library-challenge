require 'yaml'
require 'date'

class Library
    attr_accessor :collection 
    def initialize
        @collection = YAML.load_file('./lib/data.yml')
        @available_books = show_available_books 
        @non_available_books = show_non_available_books
    
    end

def show_available_books
    @collection.select { |obj| obj[:available] == true }
end

def show_non_available_books
    @collection.select { |obj| obj[:available] == false  }
end

def select_book(title)
    selected_book = @collection.select { |obj| obj[:item][:title] == title }
end

end

library = Library.new
puts library.select_book('Skratta lagom! Sa pappa Åberg')

