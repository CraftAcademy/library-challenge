require 'yaml'
require 'pry'
require './lib/library.rb'

class Visitor < Library    

    def see_available                     
        all_books = self.read_book_list
        availible_books = all_books.select { |book| book[:available] == true }             
    end

end