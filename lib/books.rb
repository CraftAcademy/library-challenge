require 'date'
require 'yaml'


#ccollection = YAML.load_file('./lib/database.yaml')

class Books
    STANDARD_BORROWING = 30
    attr_accessor :details

    def initialize
        @details = YAML.load_file('./lib/database.yaml')
    end

    def search_by_title(title)
        details.select { |obj| obj[:item][:title].include? "The Four Hour Work Week"  }
    end

    def search_by_author(author)
        details.detect { |book| book[:item][:author].include? author }
    end

    def available_books
        details.select { |book| book[:available] == true }
    end

    def borrower
        details.select { |book| book[:item][:author].include? borrower }
    end
    
    def set_return_date
        Date.today.next_day(STANDARD_BORROWING).strftime('%d/%m/%y')
    end
end 


    #attr_accessor :title, :author, :availability, :return_date, :borrower
    
    #def initialize
     #   @title = "Four Hour Work Week"
      #  @author = "Tim Ferriss"
       # @status = false 
       #@return_date = set_return_datecol
       #@borrower = nil 
    #end

#p collection ['books']

#collection['books'] each do |letter, hash|
 #   p letter
 #p hash['author']
 #  p hash['title']
  #  p hash['status']
   # p hash['return_date']
    #p hash['borrower']
#end

# p collection['books]']
# p collection['books]'].values.map
