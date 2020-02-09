require 'yaml'

class Library
    attr_accessor :collection
    def initialize
        @collection = YAML.load_file('./lib/data.yml')
    end

    def available_book(title)
        @available_book = @collection.select { |obj| obj[:item][:available] == true }
    end

    def select_book(title)
        @selected_book = @collection.select { |obj| obj[:item][:title] == title }
    end

    def due_date
        Date.today + 30
    end
    
    
end