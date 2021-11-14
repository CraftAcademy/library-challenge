require "date"
require "./lib/person.rb"
#require "./lib/data.yml"
require 'yaml'

class Library
    attr_accessor :library, :book_availible

    def initialize() #only need to read the YAML file to check for books
        @library = YAML.load_file('./lib/data.yml')
        @book_availible = book_availible

    end

    def browse_book (args={})

    end

    def borrow_book(title, account)
        book_availible(title) ? checkout_ok(title, account) : checkout_nok(title) 
    end

    private
    

    def book_availible
        @library.select { |book| book[:item][:return_date] == nil }
    end

    
    def checkout_ok(title, account)
        library.detect { |book| book[:item][:title] == title }[:availible] = false
        library.detect { |book| book[:item][:title] == title }[:return_date] = Date.today.next_month
        account.on_hand.append(library.detect { book| book[:item][:title] == title })
        library_update
        #{ status: true, message: "You have borrowed #{title}, please return ", Date.today.next_month }
        { status: true, message: "You've checked out #{title}", date: Date.today, return_date: Date.today.next_month }
    end

    def checkout_nok
        return_date = library.detect { |book| book[:item][:title] == title }[:return_date]
        {message: "#{title} is not availible, is expected to be returned #{return:_date}" }
    end


    def library_update
        File.open.('./lib/data.yml', 'w') { |file| file.write library.to_yaml }
    end
end
