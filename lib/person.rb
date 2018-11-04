class Person
    require 'date'
    require 'yaml'
    require './lib/library.rb'

    attr_accessor :name, :rented_books

    def initialize (arg = {})
        @name
        @rented_books = []
        set_name(arg[:name])
    end

    def set_name(name)
        name == nil ? missing_name : @name = name
    end

    def rent_book(arg = {})
        lib = arg[:lib]
        lib.checkout_book(arg[:title], @name)
        add_to_rented_book(lib)
    end

    def return_book(arg = {})
        lib = arg[:lib]
        title = arg[:title]
        find_book(lib, title)
    end

    def missing_name
        raise 'Missing name'
    end
    
    def find_book(lib, title)
        lib.collection.each do |book|
            if book[:title] == title
                rented_book = {title: book[:title], author: book[:author], return_date: book[:return_date]}
                @rented_books.delete(rented_book)
                book[:status] = 'available'
                book[:return_date] = nil
                book[:checked_out_to] = nil
                lib.check_available_books
            end
        end
    end

    def add_to_rented_book(lib)
        lib.collection.each do |hash|
            if hash[:checked_out_to] == @name
                book = {title: hash[:title], author: hash[:author], return_date: hash[:return_date]}
                @rented_books.push(book)
            end
        end
    end
end