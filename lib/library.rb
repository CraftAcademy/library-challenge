class Library 
    attr_accessor :collection

    STANDARD_LENDING_PERIOD_IN_DAYS = 30

    def initialize
        collection = []
    end


    def addBook(title, author)
        return_date = Time.now + STANDARD_LENDING_PERIOD_IN_DAYS
        book = {item: {title: title, author: author}, available: true, return_date: return_date}
        collection.push(book)
    end

end