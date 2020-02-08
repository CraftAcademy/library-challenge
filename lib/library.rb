require 'yaml'

class Library
    attr_accessor :collection_books
    
    def initialize
        @collection_books = YAML.load_file('./lib/data.yml')
    end


   @collection_books.each do |available: , **|
   return available
   end
  

end

private


