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
        #case
        if @books[book_num][:member] == member.name
            puts 'You already have this book.'
        elseif @books[book_num][]
            #puts 'Selected book is unavailable to borrow.'
        else
            add_return_date(book_num)
            add_member_name(book_num, member)
            add_not_available(book_num)
            available_books? #update available books list after checkout
            puts 'Your book, "' + @books[book_num][:item][:title].to_s + '", is due back in one month!'
        end
    end

    #Private
    #These functions can be private in practice, but to complete successful tests they are not.
    
    def available_books?
        @available_books = @books.select{ |obj| obj[:available] == true}
    end


    #methods when book is available for check out
    def add_member_name(book_num, member)
        @books[book_num][:member] = member.name
        File.open('./lib/collection_new.yml', 'w') { |f| f.write books.to_yaml }
    end

    def add_return_date(book_num)
        @books[book_num][:return_date] = Date.today.next_month.strftime('%Y-%m-%d')
        File.open('./lib/collection_new.yml', 'w') { |f| f.write books.to_yaml }
    end

    def add_not_available(book_num)
        @books[book_num][:available] = false
        File.open('./lib/collection_new.yml', 'w') { |f| f.write books.to_yaml }
    end


end