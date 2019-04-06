require 'yaml'

class Library
    attr_accessor :collection
    def initialize
        @collection = YAML.load_file('./lib/data.yml')
    end

def show_available_books
    available_books = @collection.select { |obj| obj[:available] == true }
end

def show_non_available_books
    non_available_books = @collection.select { |obj| obj[:return_date] }
end

def select_book(title)
    @selected_book = @collection.select { |obj| obj[:item][:title] == title }
end

end