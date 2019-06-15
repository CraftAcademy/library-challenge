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
        if nonexistant(book_num, member)
            'Selected book does not exist.'
        elsif already_borrowed(book_num, member)
            'You already have this book.'
        elsif unavailable(book_num, member)
            'This book is checked out by someone else.'
        else
            add_return_date(book_num)
            add_member_name(book_num, member)
            add_not_available(book_num)
            available_books? #updates available books list after checkout
            puts 'You now have "' + @books[book_num][:item][:title].to_s + '".  It is due back in one month! ' + @books[book_num][:return_date].to_s 
        end
    end

    #Private
    #These functions can be private in practice, but to complete successful tests they are not.
    
    def available_books?
        @available_books = @books.select{ |obj| obj[:available] == true}
    end

    #methods when book is not available for check out
    def already_borrowed(book_num, member)
        @books[book_num][:member] == member.name
    end

    def unavailable(book_num, member)
        (@books[book_num][:available] == false && @books[book_num][:member] != member.name)
    end

    def nonexistant(book_num, member)
        @books[book_num] == nil
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