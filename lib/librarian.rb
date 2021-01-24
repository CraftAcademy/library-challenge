require 'date'
require 'pry'
require 'yaml'
require './lib/visitor.rb'

class Librarian
    attr_accessor :list

    def initialize
        @list = YAML.load_file('./lib/data.yml')
    end

    def check_availability(title)
        book = @list.detect { |hash| hash[:book][:title] == title }
        book[:available]
    end

    def check_out(title, visitor)

        book = @list.detect { |hash| hash[:book][:title] == title }
        if book[:available] == false
            already_rented 
        else
        book[:return_date] = Date.today.next_month.strftime('%d/%m')
        print "Thanks for using our library, please return the book before: #{book[:return_date]}, thanks!"
        book[:available] = false

        visitor.rented_books.push(book)
        end
    
    end

    def check_return_date(title)
        book = @list.detect { |hash| hash[:book][:title] == title }
        book[:available] == false ? book[:return_date] : not_rented_out
    end

    private

    def not_rented_out
        raise 'Book is not rented out.'
    end

    def already_rented
        raise 'The book is already rented!'
    end

end
