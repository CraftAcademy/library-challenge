class Person
    require 'date'
    require 'yaml'
    require './lib/library.rb'

    attr_accessor :name, :rented_book

    def initialize (arg = {})
        @name
        @rented_book = []
        set_name(arg[:name])
    end

    def set_name(name)
        name == nil ? missing_name : @name = name
    end

    def missing_name
        raise 'Missing name'
    end

    def rent_book(arg = {})
        lib = arg[:lib]
        lib.checkout_book(arg[:title], @name)
        add_to_rended_book(lib)
    end

    def add_to_rended_book(lib)
        lib.collection.each do |hash|
            if hash[:checked_out_to] == @name
                book = {title: hash[:title], author: hash[:author], return_date: hash[:return_date]}
                @rented_book.push(book)
            end
        end
    end
end

person = Person.new(name: 'Hanna')
lib = Library.new
lib.add_book(title: 'red', author: 'blue')
person.rent_book(lib: lib, title: 'red')