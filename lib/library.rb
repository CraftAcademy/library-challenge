require 'yaml'
require 'date'

class Library
    attr_accessor :books_list
    
    def initialize 
        @books_list = YAML.load_file('./lib/data.yml') 
    end

    ##def create_books_list
       # @books_list = YAML.load_file('./lib/data.yml')   
    #end



    def search_by_title(title)
        books_list.select { |book| book[:item][:title].include? title }
    end

    def search_by_author(author)
        books_list.select { |book| book[:item][:author].include? author }
    end

    def available_books
        books_list.select { |book| book[:available] == true }
    end

    def set_book_unvailable(book)
        self.books_list[book][:available] = false
        File.open('./lib/data.yml', 'w') { |f| f.write books_list.to_yaml }

    end
    
  

    #def set_book_unvailable(title)
        #books_list[array.index {|h| h[:item][:title] == title }][:available] = false
        #File.open('./lib/data.yml', 'w') { |f| f.write books_list.to_yaml }
    #end


    
end
