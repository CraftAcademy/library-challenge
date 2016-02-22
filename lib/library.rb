require './lib/book.rb'
require 'date'
class Library
  attr_accessor :list_of_books
    STANDARD_LENDING_DAYS = 15
  def initialize(options={})
      @list_of_books = options[:list_of_books] || []
  end

 def add_book(book)
   added_book={
     title: book[:title],
     author: book[:author],
     book_status: :avilable,
     person: :non,
     return_date: " "
  }
   @list_of_books.push added_book
 end

 def lend(user, book)
   detect_book = @list_of_books.detect { |a| a[:title] == book[:title] }
     case
     when detect_book[:book_status] == :not_avilable then
         'Sorry, this book is already lended'
       when user.list_of_borrowed_book.select { |a| a[:return_date] > Date.today.strftime('%d/%m/%y') } != [] then
         'Sorry, you have one overdue book to return'
     else
        @list_of_books.each do |lib_bok|
          if lib_bok[:title] == book[:title]
            change_status(user,lib_bok,book)
            borrow_book(user,book)
          end
      end
     end
  #  detect_book
 end

 def return_book(book)
    detect_book = @list_of_books.detect { |a| a[:title] == book[:title] }
    @list_of_books.each do |lib_bok|
       if lib_bok[:title] == book[:title]
             lib_bok[:author] == book[:author]
             lib_bok[:book_status] = :avilable
             lib_bok[:person] = :non
             lib_bok[:return_date] = ""
        end
    end
  lib_bok
end

 def change_status(user,lib_bok,book)
   lib_bok[:author]=book[:author]
   lib_bok[:book_status] = :not_avilable
   lib_bok[:person] = user
   lib_bok[:return_date] = set_return_date
 end

 def borrow_book(user,book)
    user.list_of_borrowed_book.push book
    user
 end

 def set_return_date
      Date.today.next_day(STANDARD_LENDING_DAYS).strftime('%d/%m/%y')
 end
end
