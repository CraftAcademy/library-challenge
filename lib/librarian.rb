require 'pry'
require 'yaml'

puts "*********************************************************"
puts ""
puts "Welcome to the Library.  What would you like to do today?"
puts ""
puts "--Call a Librarian with Librarian = Librarian.new!"
puts "--Search books by title (Librarian.search_title('title'))"
puts "--Search books by author (Librarian.search_author('author'))"
puts "--To check out a book, search for its title/author first!"
puts "--To return a book, search for its title/author first!"
puts ""
puts "*********************************************************"

class Librarian

    attr_accessor :books, :library

    def initialize
        @books = 10
        @library = load_library
    end

    def load_library
        library = YAML.load(File.open(File.join(File.dirname(__FILE__), 'library.yml')))
    end

    def search_title(title)
        result = library.detect { |obj| obj[:item][:title] == title  }   
        result == nil ? no_matches : checkout_books(result)
    end

    def search_author(author)
        result = library.detect { |obj| obj[:item][:author] == author  }
        result == nil ? no_matches : result   
    end

    def no_matches
        puts "Your search returned no matches!"
    end

    def verify_reader_account(name, card_number)
        {name: "Ronald McDonald", card_number: 12345}
    end
    
    def checkout_books(search_result)
       puts ""
       puts "#{search_result[:item][:title]} by #{search_result[:item][:author]} is available."
       puts "Would you like to check it out?(Y/N)"
       answer = gets.chomp
       if (answer == 'Y') or (answer == 'y') or (answer =='Yes') or (answer =='yes')
            if search_result[:available] == true
                search_result[:available] = false
                search_result[:return_date] = Date.today.next_month(1)
                File.open('./lib/library.yml', 'w') { |f| f.write library.to_yaml }
                puts "Check out confirmed, library has been updated!"
            else
                puts "Someone else has already checked out that title!"
            end
        elsif (answer != 'Y') or (answer != 'y') or (answer !='Yes') or (answer !='yes') and 
            (answer != 'N') or (answer != 'No') or (answer != 'no') or (answer != 'n')
            puts "Invalid input!"
        else
            puts "Book check out canceled."
        end
    end

    def return_books(title)
        result = library.detect { |obj| obj[:item][:title] == title  }   
        if result == nil
            no_matches
        else 
            puts "Would you like to return '#{search_result[:item][:title]}' by '#{search_result[:item][:author]}'?"
            answer = gets.chomp
            if answer == 'Yes'
            if search_result[:available] == false
                search_result[:available] = true
                search_result[:return_date] = nil
                File.open('./lib/library.yml', 'w') { |f| f.write library.to_yaml }
                puts "Book return confirmed, library has been updated!"
            else
                puts "Book return canceled"
            end
       end
    end

    def update_books(title, author)
        {title: 'title', author: 'author', date: Date.today, updated?: true}
    end

    def print_receipt()
        #TODO
    end
        
    
end