require "date"
require "yaml"

class Library
    attr_accessor :books

    def initialize
        @books = YAML.load_file("./lib/books.yml")
    end

    def search_by_title(title_str)
        books.select { |book| book[:title].include? title_str }
    end

    def search_by_author(author_str)
        books.select { |book| book[:author].include? author_str }
    end

    def checkout_book (index, name)
        books[index][:available] = false
        books[index][:return_date] = Date.today.next_month.strftime("%d/%m/%y")
        books[index][:borrowed_by] = name 
        update_books
        books[index]
    end

    def update_books
        File.open("./lib/books.yml", "w") {|f| f.write books.to_yaml}
    end

    def add_new_book (title, author)
        books.push ({
            :index=>books.length, 
            :title=>title, 
            :author=>author, 
            :available=>true, 
            :return_date=>nil, 
            :borrowed_by=>nil
            })
        update_books
        books
    end

    def return_book (index)
        books[index][:available] = true
        books[index][:return_date] = nil
        books[index][:borrowed_by] = nil
        update_books
        return "Book succsessfully returned!"
    end
    


end
