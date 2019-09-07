require './lib/library'
class Book  
    STANDARD_VALIDITY_DAYS = 30
    attr_accessor :author, :title, :return_date, :book_status

    def initialize
        @author = collection.select { |book| book[:item][:author].include? "" }
        @title = :title
        @return_date = set_return_date
        @book_status = :available
    end

    private
    def set_return_date
        Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('%d/%m/%y')
    end

    def self.unavailable(book)
        book.book_status = :unavailable
    end

end

##
    collection.select { |book| book[:item][:title].include? "Alfons och soldatpappan" }
        collection[0][:available] = false
        File.open('./lib/data.yml', 'w') { |book| book.write collection.to_yaml}
        collection.select { |book| book[:item][:title].include? "Alfons och soldatpappan" }