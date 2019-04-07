require "date"
require "yaml"

class Visitor
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def view_books
        books = YAML.load_file("./lib/books.yml")
        books.each do |book|
            book.keep_if {|k| k != :borrowed_by}
        end
    end

    def search_by_title(title_str)
        list = view_books
        list.select { |book| book[:title].downcase.include? title_str }
    end

    def search_by_author(author_str)
        list = view_books
        list.select { |book| book[:author].downcase.include? author_str }
    end

    def checkout_book (index)
        books = YAML.load_file("./lib/books.yml")
        if books[index] == nil then return "This book does not exist! Try another index number please."
            elsif books[index][:borrowed_by] == @name then return "You already borrowed this book!"
            elsif books[index][:available] == false then return "This book is not available for checkout!"
            else
            books[index][:available] = false
            books[index][:return_date] = Date.today.next_month.strftime("%d/%m/%y")
            books[index][:borrowed_by] = @name 
            File.open("./lib/books.yml", "w") {|f| f.write books.to_yaml}
            return "You have successfully borrowed the book '#{books[index][:title]}' by #{books[index][:author]}. Please return it by #{books[index][:return_date]}."
        end
    end

    def my_books
    books = YAML.load_file("./lib/books.yml")
    search = books.find_all {|book| book[:borrowed_by] == "#{name}"}
        if search == []
            return "You have not borrowed any books"
        else p "You have borrowed:"
            search.each do |book_search|
            p "'#{book_search[:title]}' by #{book_search[:author]}, return date: #{book_search[:return_date]}"
            end
    "Happy reading!"
        end
    end
    
end