require 'yaml'
require 'date'
require './lib/library.rb'

class Visitor 
    

    def initialize 
       @catalogue = YAML.load_file('./lib/data.yml')
    end

    def show_list 
        @catalogue 
    end

   def see_title 
     book_title = [@catalogue[0][:item][:title],
                     @catalogue[1][:item][:title],
                     @catalogue[2][:item][:title],
                     @catalogue[3][:item][:title],
                     @catalogue[4][:item][:title]] 
    end

    def see_author
    book_author = [@catalogue[0][:item][:author],
                     @catalogue[1][:item][:author],
                     @catalogue[2][:item][:author],
                     @catalogue[3][:item][:author],
                     @catalogue[4][:item][:item]]
    end


end