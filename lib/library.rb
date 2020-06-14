require 'yaml'
require 'date'

class Library
    attr_accessor :catalogue, :exp_date

    STANDARD_VALIDITY_DAYS = 30

    def initialize
        @catalogue = YAML.load_file('./lib/data.yml')
        @exp_date = return_date

    end

   def book_list
       @catalogue
   end
   
    def show_title_author
        for i in 0..4
            puts catalogue[i][:item]
        end
    end

     def book_availability  
        catalogue.select {|book_status| book_status[:available] == true}          
     end

     def return_date
         Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('%d/%m/%y')
     end
    

end

