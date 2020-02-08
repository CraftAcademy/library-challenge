require 'yaml'

class Library
   attr_accessor :collection, :search_word

   DAYS_BEFORE_RETURN = 30

   def initialize
      @collection = YAML.load_file('./lib/inventory.yml')
   end

   def select(search_word)
      collection.select {|book| book[:item][:title].include? search_word}
   end
    
end 

