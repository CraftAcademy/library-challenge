class Library
    attr_accessor :books

    def initialize
        @books = [{title: 'Harry Potter', author: 'JK Rowling', available: true}, 
        {title: 'Potter', author: 'Rowling', available: false},
        {title: 'Gatsby', author: 'Shahin', available: true},
        {title: 'Alien', author: 'Arnold', available: true}]
    end

    def checkout(title)
        find_book = @books.find { |book| book[:title] == title }
        availablity = find_book[:available]
        availablity ? 'The book is yours' : 'The book is unavailable'
    end
    
end