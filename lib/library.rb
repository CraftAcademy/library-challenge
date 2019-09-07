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

    def search_book(apple)
        collection.select { |book| book[:item][:title].include? apple}
        end

end
end