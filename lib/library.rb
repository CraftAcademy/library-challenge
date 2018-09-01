require 'yaml'
require 'date'

class Library
    attr_accessor :collection 

    def initialize 
        @collection = YAML.load_file('./lib/books.yml')
    end

    def book_available(title)
        @collection.any? { |object| object[:item][:title] == title && object[:available] ==true }
    end

    def checkout(args)
        args[:library] == nil ? missing_atm : atm = args[:atm]
        name = @name
        book = @title
        return_date = Date.today + 
        response = person.book_shelf[]
        response[:status] == true ? increase_cash(response) : response




end 

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