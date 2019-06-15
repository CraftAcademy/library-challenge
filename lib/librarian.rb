require 'date'
require 'yaml'

class Librarian

    #attributes accessor to easily change instance variables
    attr_accessor :view

    #give instance of class initial attributes
    def initialize
        @view = nil
    end

    #public methods to be accessed by user in irb or other classes
    def check_books
        @view  = YAML.load_file('./lib/collection.yml')
    end

    #private methods to be accessed only by methods in this class
    #private


end