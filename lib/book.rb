require './lib/visitor.rb'
require './lib/library.rb'

class Book
    attr_accessor :available, :title, :author, :return_date

    def initialize(attrs = {})
        @title = attrs[:title]
        @author = attrs[:author]
        @available = true
        @return_date = nil #changing from due_date to return_date since that is the attribute in the data.yaml file. Also adding nil cause a book shouldn't have a return date when initialized
    end

    def add_book
        new_book = { 
            item: [ { title: @title, author: @author } ],
            available: @available,
            return_date: @return_date }
        File.open("./lib/data.yaml", "w") { |file| file.write(new_book.to_yaml) }
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
