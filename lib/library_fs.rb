require "date"
require "./lib/book.rb"
#require "./lib/data.yml"
require 'yaml'

class Library
    attr_accessor :author, :book, :title

    def initialize() #only need to read the YAML file to check for books
        collection = YAML.load_file('./lib/data.yml')

    end

    def file_book(author, title)
        @book = Book.new({ author: self.author, title: self.title})
        @bookID = generate_bookID()
        @status = :active
        @return_date = nil
        File.open('./lib/data.yml', 'w') {|file| file.write(lib.to_yaml)}

    end

    def check_out(title)
        # get data from YAML assuming book is availible (title, author & book ID)
        # set expiery date
        # update Library YAML with expected return date
        # maybe even describe who borrowed it



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
