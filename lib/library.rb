require 'yaml'
require 'date'
require 'colorize'
require 'awesome_print'

class Library
    attr_reader :books

    def initialize 
        get_books
    end    

    def search(search_string, type = "title", available = nil)
        get_books
        filtered_list = available.nil? ? @books : available_books
        puts "Searching for#{" available books with" unless available.nil?} #{type}s that includes '#{search_string}'...".yellow
        response = search_books(filtered_list, type.downcase, search_string)
    end

    def available_books
        response = @books.select do |book|
            book[:available] == true
        end        
    end

    def checkout(title, borrower)        
        book_to_checkout = available_books.select {|book| book[:item][:title] == title}
        book_not_found if book_to_checkout.empty?
        lend_book_to_borrower(title, borrower)
        update_database(book_to_checkout)
        puts "#{title} has been handaded over to #{borrower.name}. Plese return it before #{one_month_from_now}".green
    end


    private

    def update_database(book_to_checkout)
        database_index = @books.rindex(book_to_checkout[0])
        @books[database_index][:available] = false
        @books[database_index][:return_date] = one_month_from_now
        File.open('./lib/books_database.yml', 'w') { |f| f.write @books.to_yaml }
    end

    def lend_book_to_borrower(title, borrower)
        borrower.borrowed_books[:title] = title
        borrower.borrowed_books[:return_date] = one_month_from_now
    end

    def search_books(filtered_list, type, search_string)
        filtered_list.select do |book|
            book[:item][type.to_sym].include?(search_string)
        end
    end

    def one_month_from_now
        Date.today.next_month.strftime("%y-%m-%d")
    end

    def get_books
        @books = YAML.load_file('./lib/books_database.yml')
    end
    
    def book_not_found
        raise 'I could not find that book. Did you spell the title correctly?'.red
    end

end