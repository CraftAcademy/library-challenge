require 'yaml'

class Library

    attr_accessor :books, :all_books

    def initialize 
        @books = YAML.load_file('./lib/data.yml') 
        @lib_name = 'Bibblan' 
    end

    def list_books
        @all_books = []

        books.each do |book| 
            book_title = book[:item][:title]
            book_author = book[:item][:author]
            availible = book[:availible] ? 'Availible' : 'Not availible'
            @all_books << "#{book_title} - #{book_author} - #{availible}"
        end
        @all_books
    end

    def search(title)
        @books.select do 
            |book|  book[:item][:title] == title 
        end
    end

    

end