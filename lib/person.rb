require 'yaml'

class Person

    # let[:library] { instance_double('Library') }

    attr_accessor :name, :borrowed_books, :book_list, :book_return

    def initialize (attrs = {})
        @book_list = YAML.load_file('./lib/data.yml')
        set_name(attrs[:name])
        @borrowed_books = []
        @book_return = book_return
    end

    def set_name(obj)
        obj == nil ? missing_name : @name = obj
    end

    def missing_name
        raise "You need a name"
    end

    def book_search(search_term)
        book_return = book_list.detect { |bok| bok[:item][:title].include? search_term } || book_list.detect { |bok| bok[:item][:author].include? search_term }
    end

    def search_return
        puts "Here is what we found"
        puts "Title: #{book_return[:item][:title]}"
        puts "Author: #{book_return[:item][:author]}"
            if book_return[:available] == false 
            puts "Not available, back #{book_return[:return_date]}"
            else 
            puts "Available"
        end
end


    end

    # def borrow
    #     case book_return
    #     when book_return[:available] == true
    #         puts "Do  you want to borrow it (y/n)?"
    #         borrow = gets.chomp.downcase
    #             if borrow = "y"

    #             end
    #     end
    # end

    # private

    # def checkout