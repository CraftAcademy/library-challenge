require 'yaml'
require './lib/library.rb'
require './lib/visitor.rb'

class Visitor
    attr_accessor :my_books, :collection

    def initialize
        @collection = YAML.load_file('./lib/data.yml')
        @my_books = Library.new
    end

    def my_list
        my_list = @my_books.book_checkout
    end
end