require './lib/visitor.rb'
require './lib/library.rb'

class Book
    attr_accessor :available, :title, :author, :return_date

    def initialize(attrs = {})
        set_title(attrs[:title])
        set_author(attrs[:author])
        @available = true
        @return_date = nil #changing from due_date to return_date since that is the attribute in the data.yaml file. Also adding nil cause a book shouldn't have a return date when initialized
    end

    def set_title(obj)
        obj == nil ? missing_title : @title = obj.to_s
    end

    def missing_title
        raise "A title is required"
    end

    def set_author(obj)
        obj == nil ? missing_author : @author = obj.to_s
    end

    def missing_author
        raise "An author is required"
    end

    def add_book #is it possible to create an instance of the book (ex. newBook) and then add that book to the list with this function with book.add_book?
        new_book = { 
            item: [ { title: @title, author: @author } ],
            available: @available,
            return_date: @return_date }
        File.open("./lib/data.yml", "w") { |file| file.write(new_book.to_yaml) }
    end

#How can we link this class to the data.yaml file so that the new books
#are created are added to that list?

    # def check_out
    #     @availabe = false
    # end

    # def check_in
    #     @available = true
    # end

    # def get_due_date
    #     due_date
    # end

    #for listing
    def to_string
        @title + " by " + @author + "is available: " + @available
    end
end
