require 'yaml'


class Library
    attr_accessor :collection_books, :available
    
    def initialize
        @collection_books = YAML.load_file('./lib/data.yml')
    end



## select, In this specific case, it will return the array of 
##all hashes which contain a true :available key. 

    def books_is_available?
        collection_books.select {|b| b[:available]}
    end

   def books_is_unavailable?
        collection_books.select {|b| b[:available].eql? false }
    end







    #002 > collection.detect { |obj| obj[:item][:title] == "Pippi Långstrump"  }

   #@collection_books.each do |available: , **|
   #return available
   #end
end

private


