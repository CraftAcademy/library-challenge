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
   puts book_titles =[catalogue[0][:item][:title],
                catalogue[1][:item][:title],
                catalogue[2][:item][:title],
                catalogue[3][:item][:title],
                catalogue[4][:item][:title]] 
                
     end

     def show_author
    puts book_author =[catalogue[0][:item][:author],
                    catalogue[1][:item][:author],
                    catalogue[2][:item][:author],
                    catalogue[3][:item][:author],
                    catalogue[4][:item][:author]] 

     end

     def book_status
      @book_status = :available   
     end

     def return_date
         Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('%d/%m')
     end
    

end

