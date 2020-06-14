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
   
    def show_title
    book_titles =[catalogue[0][:item][:title],
                catalogue[1][:item][:title],
                catalogue[2][:item][:title],
                catalogue[3][:item][:title],
                catalogue[4][:item][:title]] 
                
     end

     def show_author
     book_author =[catalogue[0][:item][:author],
                    catalogue[1][:item][:author],
                    catalogue[2][:item][:author],
                    catalogue[3][:item][:author],
                    catalogue[4][:item][:author]] 

     end

     def book_availability
        books_status = [catalogue[0][:available],
                         catalogue[1][:available],
                         catalogue[2][:available],
                         catalogue[3][:available],
                         catalogue[4][:available]]

             books_status.select {|value| value === true}            
     end

     def return_date
         Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('%d/%m')
     end
    

end

