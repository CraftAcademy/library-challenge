require 'book.rb'

class Visitor
    attr_accessor  :name, :checkedout_books

    def initialize(attrs = {})
        set_name(attrs[:name])
        @checkedout_books = {}
    end

    def set_name(obj)
        obj == nil ? missing_name : @name = obj.to_s
    end

    def missing_name
        raise "A name is required"
    end

    def find_book(title)
         @tittle
    end

    def check_out_book(book)
        puts "confirming checkout"
    end

    def check_in_book(book)
        puts "confirming checkin"

    end

    def list_books
    end
end