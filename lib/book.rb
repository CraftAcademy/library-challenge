require 'date'
class Book
    attr_accessor :title, :author, :category, :available, :loanee, :return_date
    DEFAULT_LOAN_DURATION_DAYS = 30
    def initialize(attrs = {})
        @title = attrs[:title]
        @author = attrs[:author]
        @category = attrs[:category]
        @available = true
        @loanee 
        @return_date
    end

    def checkout(person)
        @loanee = person
        @return_date = Date.today.next_day(DEFAULT_LOAN_DURATION_DAYS)
        @available = false
    end

    def return_book
        @loanee = nil
        @return_date = nil
        @available = true        
    end

end