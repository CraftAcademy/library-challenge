require 'date'
require 'pry'
require 'yaml'

class Library 
    attr_accessor :books 

    def initialize 
        @books = YAML.load_file('./lib/data_test.yml')
    end

    def book_search(input)
        book = books.select {|books| books[:book][:title].include? input}
    end

    def checkout (title)

        book = @books.select {|hash| hash[:book][:title] == title}

        if book[:available] == false
            raise RuntimeError 'Book unavailable'
        else
            book[:return_date] =Date.today.next_day(30)
            book[:available] = false
        end
        binding.pry
        change_availabilty
    end
    
    
    def change_availabilty 

    File.open('./lib/data_test.yml', 'w') {|file| file.write books.to_yaml}
    
    end

end


