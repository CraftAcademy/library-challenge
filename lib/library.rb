require 'yaml'
require 'Date'

class Library
STANDARD_VALIDITY_DAYS = 30
attr_accessor :t0, :t1, :t2, :t3, :t4
    def initialize
       t0 = "Alfons och soldatpappan"
       t1 = "Skratta lagom! Sa pappa Åberg"
       t2 = "Osynligt med Alfons"
       t3 = "Pippi Långstrump"
       t4 = "Pippi Långstrump går ombord"
    end

    def collection
        collection = YAML.load_file('./lib/data.yml') #Is an Array retrieve collection[integer] with Hashes inside, retrieve with :key
    end

    def read_all_books #added for a new way to show collection
        show_collection = collection.collect
        puts show_collection
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

    def unAval(book_name)
        available = YAML.load_file ('./lib/data.yml')
        available[0][:available] = false
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(available, f)}
        collection.select { |book| book[:item][:title].include? "Alfons och soldatpappan" }
    end

    def isAval(book_name)
        available = YAML.load_file ('./lib/data.yml')
        available[0][:available] = true
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(available, f)}
        collection.select { |book| book[:item][:title].include? "Alfons och soldatpappan" }
    end

    def unAval(book_name)
        available = YAML.load_file ('./lib/data.yml')
        available[1][:available] = false
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(available, f)}
        collection.select { |book| book[:item][:title].include? "Skratta lagom! Sa pappa Åberg" }
    end

    def isAval(book_name)
        available = YAML.load_file ('./lib/data.yml')
        available[1][:available] = true
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(available, f)}
        collection.select { |book| book[:item][:title].include? "Skratta lagom! Sa pappa Åberg" }
    end

    def unAval(book_name)
        available = YAML.load_file ('./lib/data.yml')
        available[2][:available] = false
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(available, f)}
        collection.select { |book| book[:item][:title].include? "Osynligt med Alfons" }
    end

    def isAval(book_name)
        available = YAML.load_file ('./lib/data.yml')
        available[2][:available] = true
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(available, f)}
        collection.select { |book| book[:item][:title].include? "Osynligt med Alfons" }
    end

    def unAval(book_name)
        available = YAML.load_file ('./lib/data.yml')
        available[3][:available] = false
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(available, f)}
        collection.select { |book| book[:item][:title].include? "Pippi Långstrump" }
    end

    def isAval(book_name)
        available = YAML.load_file ('./lib/data.yml')
        available[3][:available] = true
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(available, f)}
        collection.select { |book| book[:item][:title].include? "Pippi Långstrump" }
    end

    def unAval(book_name)
        available = YAML.load_file ('./lib/data.yml')
        available[4][:available] = false
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(available, f)}
        collection.select { |book| book[:item][:title].include? "Pippi Långstrump går ombord" }
    end

    def isAval(book_name)
        available = YAML.load_file ('./lib/data.yml')
        available[4][:available] = true
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(available, f)}
        collection.select { |book| book[:item][:title].include? "Pippi Långstrump går ombord" }#
    end
    
    def return_date_method(book_name)
        book_return = YAML.load_file ('./lib/data.yml')
        book_return[0][:return_date] = set_return_date
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(book_return, f)}
        collection.select { |book| book[:item][:title].include? "Alfons och soldatpappan" }
    end

    def return_date_method(book_name)
        book_return = YAML.load_file ('./lib/data.yml')
        book_return[1][:return_date] = set_return_date
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(book_return, f)}
        collection.select { |book| book[:item][:title].include? "Skratta lagom! Sa pappa Åberg" }
    end

    def return_date_method(book_name)
        book_return = YAML.load_file ('./lib/data.yml')
        book_return[2][:return_date] = set_return_date
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(book_return, f)}
        collection.select { |book| book[:item][:title].include? "Osynligt med Alfons" }
    end

    def return_date_method(book_name)
        book_return = YAML.load_file ('./lib/data.yml')
        book_return[3][:return_date] = set_return_date
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(book_return, f)}
        collection.select { |book| book[:item][:title].include? "Pippi Långstrump" }
    end

    def return_date_method(book_name)
        book_return = YAML.load_file ('./lib/data.yml')
        book_return[4][:return_date] = set_return_date
        File.open('./lib/data.yml', 'w') { |f| YAML.dump(book_return, f)}
        collection.select { |book| book[:item][:title].include? "Pippi Långstrump går ombord" }
    end
end



    

=begin
Help from StackOverflow answer: https://stackoverflow.com/questions/13948951/update-value-of-key-of-a-yaml-file-in-ruby-on-rails
 EX: I have a yml file with some key value.
age: 24
Name: XYZ
I want code to update the value of "Name" key from XYZ to ABC? How can i do it?
Solution:
data = YAML.load_file "path/to/yml_file.yml"
    data["Name"] = ABC
    File.open("path/to/yml_file.yml", 'w') { |f| YAML.dump(data, f) }
It will write into yml file. If specified key ("Name") is not present in file, it will write new key value othrwise the existing one will be replaced.


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
=end