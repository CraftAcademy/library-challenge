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
end