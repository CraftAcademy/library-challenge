require 'yaml'
require 'Date'

class Library
   attr_accessor :collection, :search_word, :return_date

   DAYS_BEFORE_RETURN = 30

   def initialize
      @collection = YAML.load_file('./lib/inventory.yml')
      # @book = {:item=>{:title=>"", :author=>""}, :available=>true, :return_date=>nil}
   end

   def list 
      puts collection
   end

   def unavailable_books
     collection.select {|book| book[:available].eql? false }
   end

   def select_title(search_word)
      collection.select {|book| book[:item][:title].include? search_word}
   end
   
   def select_author(search_word)
      collection.select {|book| book[:item][:author].include? search_word}
   end

   def set_return_date
      Date.today.next_day(Library::DAYS_BEFORE_RETURN).strftime('%d/%m/%y')

   end 
    
end