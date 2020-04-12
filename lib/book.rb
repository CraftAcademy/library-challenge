require 'date'
require './lib/person.rb'
require './lib/library.rb'
class Book
    attr_accessor :title, :author, :category, :available, :loanee, :return_date
    DEFAULT_LOAN_DURATION_DAYS = 30
    def initialize(attrs = {})
        @title = set_title(attrs[:item][:title])
        @author = set_author(attrs[:item][:author])
        @category = set_category(attrs[:item][:category])
        @available = attrs[:available].nil? ? true : attrs[:available]
        @loanee = attrs[:loanee]
        @return_date = attrs[:return_date]
        @library = attrs[:library]
    end

    def checkout(person)
        if person.active == false
            raise 'Person is not allowed to loan books' 
        end
        @available = @available ? false : (raise 'Book not available')
        @loanee = person
        @return_date = Date.today.next_day(DEFAULT_LOAN_DURATION_DAYS).strftime('%d/%m/%y')   
        rec = receipt
        person.receipts << rec
        @library.write_database
    end

    def return_book
        @return_date = nil
        @available = true
        @loanee.receipts.delete_if { |receipt| receipt[:book]==self } 
        @loanee = nil
        @library.write_database
    end

    def receipt
        {book: self, receipt: {title: @title, checkout_date: Date.today.strftime('%d/%m/%y'), return_date: @return_date}}
    end

    private

    def set_title(title)
        title == nil ? missing_title : title
    end

    def set_author(author)
        author == nil ? missing_author : author
    end

    def set_category(category)
        category == nil ? missing_category : category
    end

    def missing_author
        raise "Book must have an author"
    end

    def missing_title
        raise "Book must have a title"
    end

    def missing_category
        raise "Book must have a category"
    end

end
