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
        @collection.any? { |object| object[:item][:title] == title && object[:available] ==true }
    end

    def return_date
        @return_date = Date.today.next_month.strftime('%d/%m/%y')
    end


    def checkout_a_book
    
        if book_available != true
            to raise('the chosen book is unavailable')
        else checkout_book [:available] == true
            checkout_book [:return_date] == return_date
            checkout_book [:available] == false
            "thank you for checking out, please return by #{return_date}" 
        end
    end
end

    # def checkout(args)
    #     args[:library] == nil 
    #     name = @name
    #     book = @title
    #     return_date = Date.today.next_month
    #     response = person.book_shelf[]
    #     response[:status] == true 
    # end

 

#Need method for return date
# The flow of checking out an item could be:
# 1. Search for the item in library
# 2. Check out the ite

                # person.rb
                # checked out books go to book_shelf variable
# Search for book example
#  collection.detect { |obj| obj[:item][:title] == "Pippi Långstrump"  
# detect will return exact match of search
# #include?. searching for Pippi långström, type only Poppi and get full title