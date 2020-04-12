require './lib/library.rb'
class User 
    attr_accessor :name, :account, :library

    def initialize(attr={})
        @name = :name
        @library = Library.new
        @book = nil
    end

    def search_book(search_word)
      @book = @library.search(search_word)
    end
end
