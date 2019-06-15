
class Library
    attr_accessor :books

    def initialize
        @books = YAML.load_file('./lib/inventory.yml')
    end

    def book_status(book)
        @books = 

    # it 'return avaiable if the status of book is avaiable' do
    #     expect(subject.books_status).to eq :availeble
    # end

end