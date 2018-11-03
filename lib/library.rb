require 'yaml'

class Library
    attr_accessor :collection

    def initialize 
        @collection = YAML.load(File.read('./lib/data.yml'))
    end

    def display_available_books(collection)
        available_collection = []
        collection.each do |item|
            item[:available] ? available_collection << item : false
        end
        return available_collection
    end

    def select_book(available_collection,selection_position)
        selected_book = []
        selected_book << available_collection[0]
    end 

    def book_checkout(selected_book,username,pin_code,customer) 
        selected_book[:available] = false
        selected_book[:return_date] = (Date.today + 30).to_s 
        add_to_customer_reading_list(selected_book,username,pin_code,customer)
        selected_book
    end

    def add_to_customer_reading_list(selected_book,username,pin_code,customer)
        customer.reading_list << selected_book
    end

end
