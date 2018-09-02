require 'yaml'

class Person

    attr_accessor :name, :borrowed_books, :book_list

    def initialize
        @book_list = YAML.load_file('./lib/data.yml')
        @name = name
        @borrowed_books = []
    end

    def book_search(search_term)
    book_return = book_list.detect { |bok| bok[:item][:title].include? search_term } || book_list.detect { |bok| bok[:item][:author].include? search_term }

        # puts "Here is what we found:"
        # puts "Title: #{book_return[:item][:title]}"
        # puts "Author: #{book_return[:item][:author]}"
        # if book_return[:available] = false 
        # puts "Not available, back on #{book_return[:return_date]}"
        # else 
        #     puts "Available"
        # end
end

        # print "Here is what we found:"
        # puts "Title: #{book_return[:item][:title]}"
        # puts "Author: #{book_return[:item][:author]}"
        # if book_return[:available] = false 
        # puts "Not available, back on #{book_return[:return_date]}"
        # else 
        #     puts "Available"
        # end
        # puts "Do  you want to borrow it (y/n)?"
        #     borrow = gets.chomp
        #     if borrow = "y"
        #     end

end

