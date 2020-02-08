require 'yaml'


class Library
    attr_accessor :collection_books
    
    def initialize
        @collection_books = YAML.load_file('./lib/data.yml')
    end



    #002 > collection.detect { |obj| obj[:item][:title] == "Pippi Långstrump"  }

   #@collection_books.each do |available: , **|
   #return available
   #end
end

private


