require "date"
require "yaml"

class Library
    attr_accessor :books

    def initialize
        @books = YAML.load_file("./lib/books.yml")
    end

    def search_by_title(title_str)
        search = books.select { |book| book[:title].include? title_str }
    end

    def search_by_author(author_str)
        search = books.select { |book| book[:author].include? author_str }
    end

    def checkout_book (index)
        books[index][:available] = false
        books[index][:return_date] = Date.today.next_month.strftime("%d/%m/%y")
        update_books
        books[index]
    end

    def update_books
        File.open("./lib/books.yml", "w") {|f| f.write books.to_yaml}
    end

end
