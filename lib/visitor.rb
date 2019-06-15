class Visitor
    attr_accessor  :name, :book_list

    def initialize(attrs = {})
        set_name(attrs[:name])
        @book_list = {}
    end

    def check_out_book(book)
        #confirmation
    end

    def check_in_book(book)
        #confirmation
    end

    def list_books()
    end
end