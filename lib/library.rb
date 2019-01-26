require 'yaml'
require 'date'

class Library
 
    attr_accessor :collection, :checked_out, :available

    def initialize
        @collection = YAML.load_file('./lib/data.yml')
        @checked_out = show_unavailable_books
        @available = show_available_books
        

    end
    

    def show_available_books

        available_books = []
        @collection.each do |item| 
        
        item[:available] ? available_books << item : false
        end
        available_books
    end

    def show_unavailable_books

        unavailable_books = []
        @collection.each do |item| 
        
        item[:available] == false ? unavailable_books << item : false
        end
        unavailable_books
    end


    

    def select_book(title)

        @collection.select { |obj| obj[:item][:title].include? title  }
        
    end

    
    
    def checkout_book(index)
        if
        @collection[index][:available] == false
        print "Already checked out"
        else
        puts "Whats your name?"
        name = gets.strip
        @collection[index][:checked_out_by]= name
        @collection[index][:available]= false
        @collection[index][:return_date]= Date.today.next_month
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
        print "Thank you! Please return within a month"
        end
        

    end

    

end

