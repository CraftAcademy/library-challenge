require 'data.yml'
require './lib/library.rb'
require 'date'

class Library

    attr_accessor :books

    def initialize
      @books = YAML.load_file('./lib/data.yml')
      # Person class
    end
end

def show_library
    @books
end



# Checks if books are available
def books_available
    @books.select{ |obj| obj[:available] == true }.map{|obj| obj[:item]}
end


# To search for a book
def book_search

end

# To get a return date when checking out a book
def return_date
Date.today.next_month
end

# define checkout
# define checkin
