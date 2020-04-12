require './lib/library.rb'
class User 
    attr_accessor :name, :account, :library, :account_nr

    def initialize(attr={})
        set_name(attr[:name])
        @library = Library.new
        @book = nil
        @account_nr = attr[:account_nr]
        @account = attr[:account]
    end

    def search_book(search_word)
      @book = @library.search(search_word)
    end

    def check_out_book(search_word)
        if account_nr.to_s.length == 6
      # if account is valid then its ok to check out book
      @book = @library.check_out(search_word)
      receipt
        else "You do not have a vaild account" 
        end
    end

    def check_in_book(book_name)
        @book = @library.check_in(book_name)
        (@book[:available] == true && @book[:return_date].nil?) ? "Book is checked in" : "Check in book failed"
    end

    def receipt
      {account: @account_nr, title: @book[:item][:title], return_date: @book[:return_date]}
    end

    private
    def set_name(obj)
        obj == nil ? missing_name : @name = obj
    end

    def missing_name
        raise "A name is required"
    end
  
end
