require 'yaml'
require 'date'

class Library
    attr_accessor :catalogue, :book_status, :exp_date

    STANDARD_VALIDITY_DAYS = 30

    def initialize
        @catalogue = YAML.load_file('./lib/data.yml')
        @exp_date = return_date
    end

   def book_list
        @catalogue
   end
   
    def show_title
    book_name = @catalogue[0][:item][:title]
    end

     def book_status
      @book_status = :available   
     end

     def return_date
         Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('%d/%m')
     end
    

end

