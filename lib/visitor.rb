require 'yaml'
require 'date'
#require './lib/library.rb'

class Visitor 
     attr_accessor :catalogue
    

    def initialize 
       @catalogue = YAML.load_file('./lib/data.yml')
    end

    def book_search
        catalogue.detect { |obj| obj[:item][:title].include? "Osynligt"  }
    end

    def checkout_book
        catalogue = YAML.load_file('./lib/data.yml')
        catalogue[0][:available] = false
        catalogue[0][:return_date] = Date.today.next_month.strftime('%d/%m/%y')
        File.open('./lib/data.yml', 'w') { |f| f.write catalogue.to_yaml }
        catalogue[0]
        
    end

    
   




end