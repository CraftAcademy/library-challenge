require 'date'
require 'yaml'
require './lib/library.rb'
    
class Visitor
    attr_accessor :name, :bookshelf
    
    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @bookshelf = []
    end

    def list_availability(library)
        @available_books = library.collection.select { |obj| obj[:available] == true  }
        @available_books.map {|book| book.values[0]}
    end

    def view_bookshelf
        @bookshelf
    end

    def request_checkout(title, library)
        library.checkout(title)
        update_bookshelf(library)
    end

    def request_checkin(title, library)
        library.checkin(title)
        update_bookshelf(library)
    end

    def update_bookshelf(library)
        @bookshelf = library.visitor_bookshelf
    end

    def check_return_date(title)
        @bookshelf.detect { |av| av[:item][:title].include? title }[:return_date]
    end

    private

    def set_name(obj)
        obj == nil ?  missing_name : @name = obj
    end

    def missing_name
        raise ArgumentError, "A name is required"
    end

end
