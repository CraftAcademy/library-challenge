require_relative 'user.rb'
require 'date'
require 'yaml'

class Library

    attr_accessor :collection, :all_books, :selected_book

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
        @selected_book = collection.detect { |obj| obj[:item][:title].include? book_title }
        selected_book[:available] == false ? not_available : checkout_final
    end

    def not_available
        raise 'Selection not available'
    end

    def checkout_final
        selected_book[:available] = false
        selected_book[:return_date] = Date.today.next_month(1).strftime("%Y-%m-%d")
        #File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
        selected_book
    end

end
