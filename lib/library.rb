require "date"
require "yaml"

class Library
    attr_accessor :books

    def initialize
        @books = YAML.load_file("./lib/books.yml")
    end

    def search_by_title(title_str)
        books.select { |book| book[:title].downcase.include? title_str }
    end

    def search_by_author(author_str)
        books.select { |book| book[:author].downcase.include? author_str }
    end

    def checkout_book (index, name)
        if books[index] == nil then return "This book does not exist! Try another index number please."
        elsif books[index][:available] == false then return "This book is not available for checkout!"
        else
        books[index][:available] = false
        books[index][:return_date] = Date.today.next_month.strftime("%d/%m/%y")
        books[index][:borrowed_by] = name 
        update_books
        books[index]
        end
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
        return "Book successfully added to the database"
    end

    def return_book (index)
        if books[index][:available] == true then return "This book is already in the library!"
        else
        books[index][:available] = true
        books[index][:return_date] = nil
        books[index][:borrowed_by] = nil
        update_books
        return "Book succsessfully returned!"
        end
    end
    


end
