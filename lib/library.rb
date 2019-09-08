require 'yaml'
require 'Date'

class Library
STANDARD_VALIDITY_DAYS = 30
attr_accessor :book_name, :array_number
    def initialize(attrs={})
       @book_name = book_name
       @array_number = set_array_number(attrs[:book_name])
    end

    def show_index # this gives us the entire library structures by index and book.
    collection.each_with_index { |k, v| puts k, v}
    end

    def collection
        collection = YAML.load_file('./lib/data.yml') #Is an Array retrieve collection[integer] with Hashes inside, retrieve with :key
    end

    def read_all_books #added for a new way to show collection
        show_collection = collection.collect
    end

    def search_by_author(book_author)
        collection.select { |book| book[:item][:author].include? "#{book_author}" }
    end

    def search_by_title(book_name)
        collection.select { |book| book[:item][:title].include? "#{book_name}" }
        { message: 'Please do a new search with the full book title within quotation marks.' }
    end
    
    def set_return_date
        Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('%d/%m/%y')
    end

    def book_change_availability_false(book_name)
        case  
            when change_available_status_false?(0)
                { message: 'You have checked-out the book. The return date is', date: Date.today.next_day(30).strftime('%d/%m/%y') }

            when change_available_status_false?(1)
                { message: 'You have checked-out the book. The return date is', date: Date.today.next_day(30).strftime('%d/%m/%y') }

            when change_available_status_false?(2)
                { message: 'You have checked-out the book. The return date is', date: Date.today.next_day(30).strftime('%d/%m/%y') }

            when change_available_status_false?(3)
                { message: 'You have checked-out the book. The return date is', date: Date.today.next_day(30).strftime('%d/%m/%y') }

            when change_available_status_false?(4)
                { message: 'You have checked-out the book. The return date is', date: Date.today.next_day(30).strftime('%d/%m/%y') }
            else
                print 'wrong'
        end
    end


    def unAval(array_number)
        available = YAML.load_file ('./lib/data.yml')
        available[array_number.to_i][:available] = false
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(available, f)}
    end
    def return_date_method(array_number)
        book_return = YAML.load_file ('./lib/data.yml')
        book_return[array_number.to_i][:return_date] = set_return_date
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(book_return, f)}
        collection.select { |book| book[:item][:title].include? "Alfons och soldatpappan" }
    end
    def isAval(array_number)
        available = YAML.load_file ('./lib/data.yml')
        available[array_number.to_i][:available] = true
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(available, f)}
    end

    def set_array_number(book_name)
        if book_name == "Alfons och soldatpappan" then array_number = 0
        elsif book_name == "Skratta lagom! Sa pappa Åberg" then array_number = 1
        elsif book_name == "Osynligt med Alfons" then array_number = 2
        elsif book_name == "Pippi Långstrump" then array_number = 3
        elsif book_name == "Pippi Långstrump går ombord" then array_number = 4
        else puts "can't help you I don't know that book"
        end
    end
end