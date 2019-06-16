require './lib/librarycard.rb'
require './lib/reader.rb'

require 'pry'
require 'yaml'

puts "*********************************************************************"
puts ""
puts "Welcome to the Library.  What would you like to do today?"
puts ""
puts "--To call a Librarian, enter 'LibrarianName = Librarian.new!'"
puts "--If you're a Reader, please enter 'YourName = Reader.new(name: 'Your Name')'"
puts "--If you're a Reader and don't already have a library card, you can get one by entering 'YourName.get_library_card'"
puts "--To search books by title, enter 'LibrarianName.search_title('Title')'"
puts "--To search books by author, enter 'LibrarianName.search_author('Author')'"
puts "--To check out a book by title, enter 'YourName.reader_checkout_title(title: 'Desired Title', librarian: LibrarianName)'"
puts "--To return a book by title, enter 'YourName.reader_return_title(title: 'Desired Title', librarian: LibrarianName)'"
puts "--To view the entire library enter 'YourName.view_library(LibrarianName)'"
puts "--If you need help, please enter 'YourName.help_me'"
puts ""
puts "*********************************************************************"

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
        #must connect to checkout books method
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
       puts "'#{search_result[:item][:title]}' by #{search_result[:item][:author]} is available."
       puts "Would you like to check it out?(Y/N)"
       answer = gets.chomp
       if (answer == 'Y') or (answer == 'y') or (answer =='Yes') or (answer =='yes')
            if search_result[:available] == true
                search_result[:available] = false
                search_result[:return_date] = Date.today.next_month(1)
                File.open('./lib/library.yml', 'w') { |f| f.write library.to_yaml }
                puts "Check out confirmed, library has been updated!"
                puts "Your book is due back #{Date.today.next_month(1)}.  If it is not returned, you will be executed."
                puts ""
                puts "By firing squad."
            else
                puts "Someone else has already checked out that title!"
            end
        else
            puts "Book check out canceled."
        end
    end

    def return_books(title)
        result = library.detect { |obj| obj[:item][:title] == title  }   
        if result == nil
            no_matches
        else 
            puts "Would you like to return '#{result[:item][:title]}' by #{result[:item][:author]}?"
            answer = gets.chomp
            if (answer == 'Y') or (answer == 'y') or (answer =='Yes') or (answer =='yes')
                if result[:available] == false
                    result[:available] = true
                    result[:return_date] = 'None'
                    File.open('./lib/library.yml', 'w') { |f| f.write library.to_yaml }
                    puts "Book return confirmed, library has been updated!"
                else
                    puts "That book has already been returned!"
                end
            else
                puts "Book return canceled."
            end
       end
    end    
    
end