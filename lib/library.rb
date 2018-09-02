require 'yaml'
require 'Date'

class Library
    attr_accessor :collection, :books_available, :return_date

    def initialize(attrs = {})
        @collection = YAML.load_file('./lib/data.yml')

    end

    def books_available
        collection.select { |book| book[:available] == true }
    end

    def search(book)
        collection.select { |book| book[:item][:title] == book }
    end

    def check_out(book)
        @books_available == false ? book_not_available : lend_out_book(book)
        #we want a message and the return date
    end
    
    def lend_out_book(book)
        books = collection.detect { |book| book[:title] == book }
       if books[:availble] == true
       return books[:available] = false
        # book = search(book)
        # collection[0][:available] == true
    #    collection[0][:available] = false
        # collection[collection.index(book)][:return_date] = returndate
    #    if  book = collection.select { |book| book[:available] == true }
    #         book[]
    #     collection.detect { |book| book[:available] = false }
    #     collection.detect { |book| book[:return_date] = returndate }
     File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    # # end
    end
    end

    # def index
    # end

    def book_not_available
        raise RuntimeError, "Book is not available"
    end

    def returndate
        Date.today.next_month
    end

end