require 'yaml'

class Library
attr_accessor :t0, :t1, :t2, :t3, :t4
    def initialize
       t0 = "Alfons och soldatpappan"
       t1 = "Skratta lagom! Sa pappa Åberg"
       t2 = "Osynligt med Alfons"
       t3 = "Pippi Långstrump"
       t4 = "Pippi Långstrump går ombord"
    end

    def collection
        collection = YAML.load_file('./lib/data.yml') 
    end

    def search_by_author(book_author)
        collection.select { |book| book[:item][:author].include? "#{book_author}" }
    end

    def search_by_title(book_name)
        collection.select { |book| book[:item][:title].include? "#{book_name}" }
        { message: 'Please do a new search with the full book title within quotation marks.' }
    end


    def book_change_availability_false(book_name)
        case  
            when change_available_status_false?(t0)
                { message: 'You have checked-out the book. The return date is', date: Date.today.next_day(30).strftime('%d/%m/%y') }

            when change_available_status_false?(t1)
                { message: 'You have checked-out the book. The return date is', date: Date.today.next_day(30).strftime('%d/%m/%y') }

            when change_available_status_false?(t2)
                { message: 'You have checked-out the book. The return date is', date: Date.today.next_day(30).strftime('%d/%m/%y') }

            when change_available_status_false?(t3)
                { message: 'You have checked-out the book. The return date is', date: Date.today.next_day(30).strftime('%d/%m/%y') }

            when change_available_status_false?(t4)
                { message: 'You have checked-out the book. The return date is', date: Date.today.next_day(30).strftime('%d/%m/%y') }
            else
                print 'wrong'
        end
    end

    
    private

    def change_available_status_false?(t0)
        collection.select { |book| book[:item][:title].include? "Alfons och soldatpappan" }
        collection[0][:available] = false
        File.open('./lib/data.yml', 'w') { |book| book.write collection.to_yaml}
        collection.select { |book| book[:item][:title].include? "Alfons och soldatpappan" }
    end

    def change_available_status_false?(t1)
        collection.select { |book| book[:item][:title].include? "Skratta lagom! Sa pappa Åberg" }
        collection[1][:available] = false
        File.open('./lib/data.yml', 'w') { |book| book.write collection.to_yaml}
        collection.select { |book| book[:item][:title].include? "Skratta lagom! Sa pappa Åberg" }
    end

    def change_available_status_false?(t2)
        collection.select { |book| book[:item][:title].include? "Osynligt med Alfons" }
        collection[2][:available] = false
        File.open('./lib/data.yml', 'w') { |book| book.write collection.to_yaml}
        collection.select { |book| book[:item][:title].include? "Osynligt med Alfons"  }
    end

    def change_available_status_false?(t3)
        collection.select { |book| book[:item][:title].include? "Pippi Långstrump" }
        collection[3][:available] = false
        File.open('./lib/data.yml', 'w') { |book| book.write collection.to_yaml}
        collection.select { |book| book[:item][:title].include? "Pippi Långstrump" }
    end

    def change_available_status_false?(t4)
        collection.select { |book| book[:item][:title].include? "Pippi Långstrump går ombord" }
        collection[4][:available] = false
        File.open('./lib/data.yml', 'w') { |book| book.write collection.to_yaml}
        collection.select { |book| book[:item][:title].include? "Pippi Långstrump går ombord" }
    end
end