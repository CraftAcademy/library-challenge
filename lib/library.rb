require 'yaml'

class Library
    attr_accessor :collection_books, :available
    
    def initialize
        @collection_books = YAML.load_file('./lib/data.yml')
    end
    
## select, In this specific case, it will return the array of 
##all hashes which contain a true :available key. // credit to a friend.

    def books_is_available?
        available_stuff = @collection_books.select {|h| h[:available]}
    end

   

end

private


