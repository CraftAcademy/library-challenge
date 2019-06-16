require './lib/librarycard.rb'
require './lib/librarian.rb'
class Reader

    attr_accessor :name, :library_card, :books

    def initialize(attrs = {})
        @books = 0
        set_name(attrs[:name])
        @library_card = nil
    end

    def reader_checkout_title(info)
        if @library_card == nil
            no_library_card
        elsif info[:librarian] == nil
            no_librarian  
        else
            librarian = info[:librarian]
            title = info[:title] 
            result = librarian.search_title(title)
        end
    end

    def reader_return_title(info)
        if @library_card == nil
            no_library_card
        elsif info[:librarian] == nil
            no_librarian  
        else
            librarian = info[:librarian]
            title = info[:title] 
            result = librarian.return_books(title)
        end
    end

    def view_library(librarian)
        return librarian.library
    end    


    def set_name(obj)
        obj == nil ? missing_name : @name = obj
    end

    def missing_name
        raise "A name is required"
    end

    def get_library_card
        @library_card = Card.new(owner: self)
    end

    def no_library_card
        raise 'A library card is required!'
    end

    def no_librarian
        raise 'You need to call a librarian first!'
    end

    def help_me
        puts ""
        puts "--To call a Librarian, enter 'LibrarianName = Librarian.new!'"
        puts "--If you're a Reader, please enter 'YourName = Reader.new(name: 'Your Name')'"
        puts "--If you're a Reader and don't already have a library card, you can get one by entering 'YourName.get_library_card'"
        puts "--To search books by title, enter 'LibrarianName.search_title('Title')'"
        puts "--To search books by author, enter 'LibrarianName.search_author('Author')'"
        puts "--To check out a book by title, enter 'YourName.reader_checkout_title(title: 'Desired Title', librarian: LibrarianName)'"
        puts "--To return a book by title, enter 'YourName.reader_return_title(title: 'Desired Title', librarian: LibrarianName)'"
        puts "--To view the entire library enter 'YourName.view_library(LibrarianName)'"
        puts "--If you need help, please enter 'YourName.help_me'"
        puts ""
        return "Help was a success!"
    end

end