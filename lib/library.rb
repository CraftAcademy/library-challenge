require 'yaml'

class Library

    attr_accessor :collection, :collection_books, :collection_available

    def initialize     
        @collection = YAML.load_file('./lib/data.yml')
    end

    def books
        @collection_books
        @collection_available 
    end

    def search()
        collection.select { |obj| obj[:item][:title].include? "Pippi"  }
    end

    def checkout(selected_book)
        @selected_book = selected_book
        @collection[@selected_book][:available] = false
        File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
        @collection_available = collection_available
    end

    def checkin(selected_book)
        @selected_book = selected_book
        @collection[@selected_book][:available] = true
        File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
    end

    def available
    count = 0
        @collection.each do |value|
            if value[:available] == true
            count += 1
            else
            end
        end
    return count
    end

end
    

