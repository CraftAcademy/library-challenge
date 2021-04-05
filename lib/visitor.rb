require './lib/library.rb'
require 'date'

class Visitor
    attr_accessor :name, :books_loaned

    def initialize
       @name = 'Thomas'
       @books_loaned = []
    end 
end