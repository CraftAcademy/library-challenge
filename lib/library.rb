require 'yaml'
require './lib/person.rb'

class Library
    attr_accessor :collection

    def initialize 
        @collection = load_file()
    end

    def load_file
        YAML.load_file('./lib/data.yml')
    end

    def save_to_file(collection)
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
        return true
    end

    def display_available_books(collection)
        available_collection = []
        collection.each do |item|
            item[:available] ? available_collection << item : false
        end
        available_collection
    end

    def select_book(available_collection,selection_position) 
         available_collection[selection_position - 1]
    end 

    def book_checkout(selected_book,username,pin_code,customer,collection) 
        selected_book[:available] = false
        selected_book[:return_date] = (Date.today + 30).to_s 
        add_to_customer_reading_list(selected_book,username,pin_code,customer)
        update_library_collection(selected_book,collection)
        selected_book
    end

    def add_to_customer_reading_list(selected_book,username,pin_code,customer)
        customer.reading_list << selected_book
    end

    def update_library_collection(selected_book,collection)
        collection.each do |book|
            book[:item][:title] == selected_book[:item][:title] ? book.each{ |key,value| book[key] = selected_book[key]} : false
        end
        save_to_file(collection)
    end

end
