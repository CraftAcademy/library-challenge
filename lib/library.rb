require 'yaml'
require 'date'

class Library 
    attr_accessor :collection

    STANDARD_LENDING_PERIOD_IN_DAYS = 30

    def initialize 
        @collection = create_collection()
    end

    def create_collection
        @collection = YAML.load_file('./lib/data.yml')
    end

    def change_availability(book)
        self.collection[book][:available] = false
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

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

    def setReturnDate(book)
        self.collection[book][:return_date] = Date.today.next_day(STANDARD_LENDING_PERIOD_IN_DAYS).strftime('%Y-%m-%d')
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def lendBook(book, name)
        setReturnDate(book)
        change_availability(book)
    end

end