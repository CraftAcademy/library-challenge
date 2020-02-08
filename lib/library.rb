require 'yaml'

class Library 
    attr_accessor :collection

    STANDARD_LENDING_PERIOD_IN_DAYS = 30

    def collection
        collection = YAML.load_file('./lib/data.yml')
    end

    #def change_availability(id)
     #   self.collection[id][:available] = false
    #end

    def search_author(author)
        collection.select { |book| book[:item][:author].include? "#{author}" }  
    end 

    def search_title(title)
        collection.select { |book| book[:item][:title].include? "#{title}" }
    end

end