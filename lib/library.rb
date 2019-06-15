require 'date'

class Library
    attr_accessor :books

    def initialize
        @books = YAML.load_file('./lib/inventory.yml')
    end

    def search_by_title(title)
        books.select { |book| book[:title] == title }
    end

    # def ....

    # end

    def check_out(book)
        case
        when book_is_unavailable?(book)
            { available: false, message: 'Unfortunally this book is unavailable', date: Date.today }
        else 
        perform_check_out(book)
    end

    def perform_check_out(book)
        { available: true, message: 'You just borrowed the best book in the world', date: Date.today }
    end


    # def book_status(books)
    #     @books = 
    # end
    # book status is either avaiable or borrowed
    # if the book does not exist at all, then its status should is non-existing

    # it 'is expected to have an return date on initialize' do
    #     expected_date = Date.today.next_month(1).strftime("%d/%m")
    #     expect(subject.return_date).to eq expected_date
    # end

    # def set_return_date
    #     Date.today.next_month
    # end
    # when the book is borrowed by a visitor, we would like it to print a reciept
    # with what book it is, the author and the date of return.

    # it 'return avaiable if the status of book is avaiable' do
    #     expect(subject.books_status).to eq :availeble
    # end

end