require 'yaml'

class App
    attr_accessor :collection

    def initialize
        @collection = YAML.load_file('./lib/data.yml')
    end

    def book_checkout
        collection[0][:available] = false
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def book_return
        collection[0][:available] = true
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def books
        books = 
            collection[0][:item][:title],
            collection[1][:item][:title],
            collection[2][:item][:title],
            collection[3][:item][:title],
            collection[4][:item][:title]
    end
end