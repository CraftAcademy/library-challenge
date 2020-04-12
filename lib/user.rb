require './lib/library.rb'
class User 
    attr_accessor :name, :account, :library

    def initialize(attr={})
        set_name(attr[:name])
        @library = Library.new
        @book = nil
    end

    def search_book(search_word)
      @book = @library.search(search_word)
    end

    def check_out_book(search_word)
      @book = @library.check_out(search_word)
    end

    def check_in_book(book_name)
        @book = @library.check_in(book_name)
    end

    private
    def set_name(obj)
        obj == nil ? missing_name : @name = obj
    end

    def missing_name
        raise "A name is required"
    end

end
