require 'yaml'
require './lib/person.rb'
items = YAML.load_file('./lib/data.yml')

class Library
    attr_accessor :books
    def library
        path = './lib/data.yml'
        yml = YAML::load(title)
            if item.title == 'title'
            puts title
        end
    end

    def borrowed_book(title, due_date)
        @item -= title
        account.borrowed_book = account.borrowed_book- due_date
        { status: true, message: 'success', date: Date.today, title: title, due_date: (due_date) }
    end
    
end