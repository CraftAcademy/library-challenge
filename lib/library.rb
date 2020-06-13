require 'yaml'

class Library
    attr_accessor :catalogue 

    def initialize
        @catalogue = YAML.load_file('./lib/data.yml')

    end

    def show_title
    book_name = @catalogue[0][:item][:title]
    end



end

