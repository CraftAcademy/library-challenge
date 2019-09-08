require 'yaml'

class Library
    attr_accessor :collection

    def initialize
        @collection = YAML.load_file('./lib/data.yml') 
    end
    
    def display_books
        collection.each do |book| 
        puts "#{book[:item][:title] + " " + [:author]}"
        end
    end

    def search_for_book_title(search_title)
        puts collection.select { |book| book[:item][:title].include? search_title} do
        end
    end

    def search_for_book_author(search_author)
        puts collection.select { |book| book[:item][:author].include? search_author} do
        end
    end
end