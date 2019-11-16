require 'date'
require 'yaml'

class Library

    attr_accessor :collection, :all_books

    def initialize
        @collection = read_file
    end

    def read_file
        YAML.load_file('./lib/data.yml')
    end

    def list_books
        @all_books = []
        collection.each do |book|
            book_title = book[:item][:title]
            book_author = book[:item][:author]
            book_available = book[:available] ? "Available" : "Unavailable"
            all_books << "#{book_title} - #{book_author} (#{book_available})"
        end
        @all_books
    end

    def checkout(book_title)
        selected_book = collection.select { |obj| obj[:item][:title].include? book_title }
        selected_book[0][:available] = false
        selected_book[0][:return_date] = Date.today.next_month(1).strftime("%Y-%m-%d")
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

end
