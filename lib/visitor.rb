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


end