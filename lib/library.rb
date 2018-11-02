class Library
    attr_accessor :books

    def initialize
        @books = [{title: 'Harry Potter', author: 'JK Rowling', available: true}, 
        
        {title: 'Potter', author: 'Rowling', available: false}]
    end

    def checkout(title)
       
        @books.find { |book| book[:title] }[:available]
        
    end

    
end