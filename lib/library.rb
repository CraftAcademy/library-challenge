require 'yaml'
#require 'date'

class Library
    attr_accessor :catalog, :title, :author, :available, :book, :return_date

    STANDARD_TIME_DAY = 30

    def initialize
        @catalog = YAML.load_file('./lib/data.yml')
        @return_date = set_return_date()

    end

    def author_search(user_search)
        @book = catalog.select { |obj| obj[:item][:author].include? user_search }
    end

    def title_search(user_search)
        @book = catalog.select { |obj| obj[:item][:title].include? user_search }
    end

    def set_return_date
        Date.today.next_day(STANDARD_TIME_DAY).strftime('%D')
    end


    #def checkout(user_search)

    case 

    when book_unavailable(available)
        { message: 'checkout incomplete,book unavailable', date: Date.today }

        else 

       # checkout(available, return_date)

    end

    def book_unavailable?(available)
    available == false

    end

=begin
    def checkout(message, return_date)
        catalog.
        { message: 'checkout complete', return_date: @return_date }
    end

    def new_book(args = {})
        title = args[:title]
        author = args[:author]
        available = args[:available]
    end
    def add_book
        File.open('./lib/data.yml', 'w') { |f| f.write new_book.to_yaml }
   end
=end


end