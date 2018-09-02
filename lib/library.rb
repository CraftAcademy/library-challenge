require 'yaml'
require 'date'
require 'colorize'
require 'awesome_print'
require 'pry'

class Library
    attr_reader :books, :borrower_list

    def initialize 
        get_books
        load_borrower_list
    end    

    def search(search_string, type = "title", available = nil)
        get_books
        filtered_list = available.nil? ? @books : available_books
        puts "Searching for#{" available books with" unless available.nil?} #{type}s that includes '#{search_string}'...".yellow
        ap response = search_books(filtered_list, type.downcase, search_string)
        return response
    end

    def available_books
        @books.select { |book| book[:available] == true }        
    end

    def list_available_books
        ap available_books
    end

    def checkout(title, borrower)        
        book_to_checkout = available_books.select {|book| book[:item][:title] == title}
        book_not_found if book_to_checkout.empty?
        create_borrower_id(borrower) if borrower.id == nil
        check_borrower_status(borrower)
        lend_book_to_borrower(title, borrower)
        update_database(book_to_checkout)        
        puts "#{title} has been handaded over to #{borrower.name}. Plese return it before #{one_month_from_now}".green        
    end

    def load_borrower_list
        @borrower_list = YAML.load_file('./lib/borrower_list.yml')
        @borrower_list.delete_at(0) if @borrower_list[0].nil?                
    end

    
    def create_borrower_id(borrower)        
        borrower.status = true
        borrower.id = rand(100000..999999)                     
    end

    private

    def check_borrower_status(borrower)
        case
        when (borrower.status == false)
            borrower_status_false_error            
        when borrower.borrowed_books.empty?
            puts "Borrower status is ok".green
        when borrower.borrowed_books.any? {|book| Date.parse(book[:return_date]) < Date.today}
            borrower.status = false
            return book_not_returned_on_time_error
        else
            puts "Borrower status is ok".green
        end              
    end


    def update_database(book_to_checkout)
        database_index = @books.rindex(book_to_checkout[0])
        @books[database_index][:available] = false
        @books[database_index][:return_date] = one_month_from_now
        File.open('./lib/books_database.yml', 'w') { |f| f.write @books.to_yaml }
    end

    def lend_book_to_borrower(title, borrower)
        input_hash = {title: title, return_date: one_month_from_now}
        borrower.borrowed_books << input_hash
        save_borrower_list(borrower)             
    end

    def save_borrower_list(borrower)
        borrower_hash = {name: borrower.name, 
                        id: borrower.id,
                        status: borrower.status,
                        borrowed_books: borrower.borrowed_books}                
        index = @borrower_list.find_index {|element| element[:id] == borrower.id}
        index == nil ? @borrower_list << borrower_hash : @borrower_list[index][:borrowed_books] = borrower.borrowed_books
        File.open('./lib/borrower_list.yml', 'w') { |f| f.write @borrower_list.to_yaml }
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
        raise "I could not find that book. Did you spell the title correctly?".red
    end

    def book_not_returned_on_time_error
        raise "You have books that haven't been returned on time. Please return them before borrowing another book"
    end

    def borrower_status_false_error
        raise "Status is false. This prevents your from borrowing books. Contact the reception"
    end

end