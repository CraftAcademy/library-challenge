require 'yaml'

class Library
    attr_accessor :books_list
    

    def books_list
        books_list = YAML.load_file('./lib/data.yml')   
    end



    def search_by_title(title)
        books_list.select { |book| book[:item][:title].include? title }
    end

    def search_by_author(author)
        books_list.select { |book| book[:item][:author].include? author }
    end

    def available_books
        books_list.select { |book| book[:item][:available].eq? true }
    end


    
end
