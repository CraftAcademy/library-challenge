

class Library 
    attr_accessor :books 
    def initialize 
        @books = YAML.load_file('./lib/data_test.yml')
    end

    def book_search(input)
        books.select {|books| books[:book][:title].include? input}
    end
    
end
