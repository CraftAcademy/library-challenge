require 'yaml'
require './lib/person.rb'

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
        Date.today + 30.strftime('%m/%d')
    end
    
    
end
            
    # def borrowed_book(title, due_date)
    # @item -= title
    # account.borrowed_book = account.borrowed_book- due_date
    # { status: true, message: 'success', date: Date.today, title: title, due_date: (due_date) }
    # end


    
    # def initialize
    #     @items = items
    #     path = './lib/data.yml'
    #     yml = YAML::load(title)
    #         if item.detect == 'title'
    #         puts title
    #     end
    # end
    
    

