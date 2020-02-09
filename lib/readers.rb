require 'date'
require './lib/library.rb'

class Readers
    attr_accessor :books_is_available?



    def initialize        
    end

    def check_avaible?
        test1 = books_is_available?
        return "#{test1}"
    end

end