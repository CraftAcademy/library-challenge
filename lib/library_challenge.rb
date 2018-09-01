require 'yaml'

class Library

    attr_accessor :book_list

    def initialize
        @book_list = 'data.yml'
    end

    # def book_list
    #     collection = YAML.load_file('./lib/data.yml')
    # end
end
