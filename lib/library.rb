require 'yaml'
require 'date'

class Library
    attr_accessor :books_list
    LOAN_TIME_DAYS = 30
    
    def initialize 
        @books_list = YAML.load_file('./lib/data.yml') 
    end
    




    def search_by_title(title)
        books_list.select { |book| book[:item][:title].include? title }
    end

    def search_by_author(author)
        books_list.select { |book| book[:item][:author].include? author }
    end

    def available_books
        books_list.select { |book| book[:available] == true }
    end

    def return_date ()
    Date.today.next_day(LOAN_TIME_DAYS).strftime('%d%m/%y')
    end

    def unavailable_books
        books_list.select { |book| book[:available] == false }
    end

    def set_book_unvailable(book)
        self.books_list[book][:available] = false
        File.open('./lib/data.yml', 'w') { |f| f.write books_list.to_yaml }
    end

    def  set_book_return_date(book)
        self.books_list[book][:retrun_date] = return_date
        File.open('./lib/data.yml', 'w') { |f| f.write books_list.to_yaml }
    end

    def check_out(book)
        set_book_unvailable(book)
        set_book_return_date(book)
        end

end

    # def check_out (available)
    #     index = get_book()
    #     available == false ? not_available : change_availability = true

    # end

    
    #def get_book (title )
    # @books_list.index { |book| book[:item][:title] === title}
    # end

    #def not_available 
    # raise "sorry, it is not available"
    # end

    #def change_availability
        # books_list[:item][:title] = get_book(title)
        # File.open('./lib/data.yml', 'w') { |f| YAML.dump(books_list, f) }

        #File.open('./lib/data.yml', 'w') { |f| f.write books_list.to_yaml }


    # end

    # data = YAML.load_file "path/to/yml_file.yml"
    # data["Name"] = ABC
    # File.open("path/to/yml_file.yml", 'w') { |f| YAML.dump(data, f) }

