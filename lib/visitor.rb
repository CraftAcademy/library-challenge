require './lib/library.rb'
require 'date'

class Visitor
    attr_accessor :name, :books_loaned

    def initialize (attrs = {})
       @name = (attrs[:name])
       @books_loaned = []
    end 



end

