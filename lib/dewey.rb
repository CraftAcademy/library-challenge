require 'date'
require 'yaml'

class Dewey

    #attributes accessor to easily change instance variables
    attr_accessor :books

    #give instance of class initial attributes
    def initialize()
        @books = nil
        import_books
    end

    #public methods to be accessed by user in irb or other classes
    #def xxx
    
    #end

    #private methods to be accessed only by methods in this class
    private

    #def import_books
    #    @books = YAML.load_file('./lib/collection.yml')
    #end




end