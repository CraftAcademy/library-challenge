require 'yaml'
require 'Date'
require './lib/search_service.rb'

class Library
   attr_accessor :collection, :search_word, :set_return_date

   DAYS_BEFORE_RETURN = 30

   def initialize
      @collection = YAML.load_file('./lib/inventory.yml')
      end

   def list 
      self.collection
   end

   def unavailable_books
     collection.select {|book| book[:available].eql? false }
   end

   def search_title(search_word)
      SearchService.find_title(search_word)
   end
   
   def search_author(search_word)
      SearchService.find_author(search_word)
   end

   def set_return_date
      Date.today.next_day(Library::DAYS_BEFORE_RETURN).strftime('%d/%m/%y')
   end
    
end