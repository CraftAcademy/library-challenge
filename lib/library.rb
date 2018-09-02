require 'yaml'
require 'date'

STANDARD_RETURN_PERIOD_MONTH = 1

class Library
    attr_accessor :collection, :title, :name, :return_date

    def initialize 
        @collection = YAML.load_file('./lib/books.yml')
        @return_date = Date.today
    end

    def book_available(title)
        @collection.any? { |object| object[:item][:title] == title && object[:available] == true }
    end

    def available_books
        @collection.select { |book| book[:available] == true }
    end

    def return_date
        @return_date = Date.today.next_month.strftime('%d/%m/%y')
    end

    def get_book_by_title(title)
        @collection.select { |object| object[:item][:title] == title && object[:available] == true }[0]
    end

    def checkout_a_book(title)
    
        if book_available(title) != true
            to raise('The chosen book is unavailable')
        else 
            checkout_book = get_book_by_title(title)
            checkout_book [:return_date] = Date.today.next_month.strftime('%d/%m/%y')
            checkout_book [:available] = false
            "Thank you for checking out, please return by #{return_date}" 
        end
    end
end