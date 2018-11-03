require 'yaml'
require 'date'

class Library
    attr_accessor :books

    STANDARD_VALIDITY_MONTH = 1

    def initialize
        @books = books
    end

    def collection(books)
        books.nil? ? missing_books : books
    end

    def list_of_books(title, author)
        collection = YAML.load_file('./lib/data.yml')
        puts collection.inspect
    end

    def due_date
        Date.today.next_month(STANDARD_VALIDITY_MONTH).strftime('%d/%m')
    end
end