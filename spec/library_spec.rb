require './lib/library.rb'
require 'yaml'

describe Library do

    let(:visitor) { instance_double('Visitor', name: 'Rupert') }
 
    it 'has a collection of books in the library on initialize' do
        expected_output = YAML.load_file('./lib/data.yml')
        expect(subject.collection).to eq expected_output
    end

    it 'can see a list of all AVAILABLE books in the library collection' do
        all_books = YAML.load_file('./lib/data.yml')
        expected_output = all_books.select { |obj| obj[:available] == true  }
        expect(subject.check_availability).to eq expected_output
    end

    # it 'can see the TITLE and AUTHOR of all AVAILABLE books' do
    #     all_books = YAML.load_file('./lib/data.yml')
    #     available_book_list = all_books.select { |obj| obj[:available] == true  }
    #     expected_output = available_book_list.map {|book| book.values[0]}
    #     subject.check_availability
    #     expect(subject.check_available_titles).to eq expected_output
    # end
end

# As a librarian
# In order to know what books we are able to lend to visitors
# I would like to be able to be able to see the availability of books in the collection

# As a librarian
# In order to update the availability of books in the collection
# I would like to be able to allow individuals to check out a book

# As a librarian
# In order to make the books available to other visitors in a timely manner
# I would like to set a return date 1 month from checkout date