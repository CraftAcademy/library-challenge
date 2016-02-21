require './lib/book.rb'
require 'date'
class Library
  attr_accessor :list_of_books
  def initialize(options={})
      @list_of_books = options[:list_of_books] || []
  end

 def Add_new_book(book)
   added_book={
     title: book[:title],
     author: book[:author],
     book_status: :Avilable,
     person: :non,
     return_date: " "
  }
  @list_of_books.push added_book
 end

 def lend(user, book)
   detect_book = @list_of_books.detect { |a| a[:title] == book[:title] }
     case
        when detect_book[:book_status] == :Not_avilable then
         'Sorry, this book is already lended'
        when user.list_of_borrowed_book.select { |a| a[:return_date] > Date.today.strftime('%d%m/%y') } != [] then
         'Sorry, you have one overdue book to return'
    else
        @list_of_books.each do |bok|
          if bok[:title] == book[:title]
            bok[:book_status] = :Not_avilable
            bok[:person] = :user
            bok[:return_date] = set_return_date
            print(bok)
            user.list_of_borrowed_book.push bok
          end
      end
     end
  #  detect_book
  end

  def set_return_date
      Date.today.next_day.strftime('%d%m/%y')
  end
end
