require 'yaml'
require 'date'

class Library
    attr_accessor :books

    STANDARD_VALIDITY_MONTH = 1

    def initialize
        @collection = YAML.load_file('./lib/data.yml')
        @books = books
    end

    def collection_books(books)
        books.nil? ? missing_books : books
    end

    def list_of_books(title, author)
        puts collection.inspect
    end

    def due_date
        Date.today.next_month(STANDARD_VALIDITY_MONTH).strftime('%d/%m')
    end

    def check_out_books
        collection.detect { |obj| obj[:item][:title] == 'He Died With A Falafel in His Hand'  }
        collection.select { |obj| obj[:item][:title] = title  }
        if books[:available] == true
        else books[:available] == false
        return 'kjh'
        end
    end
end