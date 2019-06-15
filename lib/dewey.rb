require 'date'
require 'yaml'

class Dewey

    #attributes accessor to easily change instance variables
    attr_accessor :books, :available_books, :return_date, :available

    #give instance of class initial attributes
    def initialize
        @books = YAML.load_file('./lib/collection_original.yml')
        available_books?
    end
    
    def checkout_book(book_num, member)
        add_return_date(book_num)
        add_member_name(book_num, member)
        not_available(book_num)
        available_books? #update available books list after checkout
        raise 'Your book(s) are due back in one month!'
    end

    #Private
    #These functions can be private in practice, but for testing purposes they are not

    def available_books?
        @available_books = @books.select{ |obj| obj[:available] == true}
    end

    def add_member_name(book_num, member)
        book_num -= 1
        @books[book_num][:member] = member.name
        File.open('./lib/collection_new.yml', 'w') { |f| f.write books.to_yaml }
    end

    def add_return_date(book_num)
        book_num -= 1
        @books[book_num][:return_date] = Date.today.next_month.strftime('%Y-%m-%d')
        File.open('./lib/collection_new.yml', 'w') { |f| f.write books.to_yaml }
    end

    def not_available(book_num)
        book_num -= 1
        @books[book_num][:available] = false
        File.open('./lib/collection_new.yml', 'w') { |f| f.write books.to_yaml }
    end


end