require 'yaml'

class Library
    attr_accessor :collection
    def initialize
        @collection = YAML.load_file('./lib/data.yml')
    end

def show_available_books
    available_books = @collection.select { |obj| obj[:available] == true }
end

def show_books_with_return_dates
    available_books = @collection.select { |obj| obj[:return_date] }
end

private
def due_date
end
    
end