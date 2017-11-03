class Individual
  attr_accessor :books

    def initialize
      @books = book_list[]
    end
end
