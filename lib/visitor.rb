require 'yaml'
require './lib/library.rb'
require 'date'

class Visitor
    attr_accessor :name, :books, :library

    def initialize(attrs = {})
        @name = set_name( attrs[:name] )
        @books = []
    end

    def visit_library
        @library = Library.new(library_vistor: self)
    end

    def set_name (name)
        name.nil? ? missing_name : @name = name
    end

    def missing_name
        raise 'A name is required'
    end 
    

end