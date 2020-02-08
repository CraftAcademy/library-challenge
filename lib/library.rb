require 'yaml'

class Library
    attr_accessor :collection_books
    
    def initialize
        @collection_books = YAML.load_file('./lib/data.yml')
    end

   
    def book_title(title)
        collection_books.detect {|obj| obj[:item][:title]}
    end

end
