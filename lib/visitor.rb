require 'yaml'
require './lib/library'

class Visitor
    attr_accessor :book_list
    def initialize 
        @book_list = set_book_list
    end

    def set_book_list
        book_list = []
    end  
end


