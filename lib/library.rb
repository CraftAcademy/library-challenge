require 'yaml'

class Library 
    attr_accessor :collection

    STANDARD_LENDING_PERIOD_IN_DAYS = 30

    def collection
        collection = YAML.load_file('./lib/data.yml')
    end

    #def change_availability(id)
    #collection[id][:available] = false
    #File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    #end

    def search_author(author)
        collection.select { |book| book[:item][:author].include? "#{author}" }  
    end 

    def search_title(title)
        collection.select { |book| book[:item][:title].include? "#{title}" }
    end

    def list_of_available_books
        collection.select { |book| book[:item][:available] == true }
    end

    def list_of_unavailable_books
        collection.select { |book| book[:item][:available] == false }
    end

end