require "date"
require "./lib/book.rb"

class Library
    attr_accessor :author, :book

    def initialize(author, title)
        @author = "Brandon Sandersson"
        @book = "Way of Kings"

    end

    def file_book(title,author)
        @author = author
        @book = title
        @bookID = generate_bookID()

    end

    def check_out(book, date)

    end
        
    def check_out(bookID)


    end

    private

    def set_expiery_date
        date.today.next_month(Book::STANDARD_VALIDITY_YRS).strftime("%m/%d")
    end

    def generate_bookID()
        rand(1000..9999)
        ## if bookID == (create a logic that checks weather book ID is duplicate, then do again untill no duplicate then generate number)
    end

end
