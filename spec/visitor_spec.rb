require './lib/visitor.rb'
require 'yaml'

describe Visitor do

    subject { described_class.new(name: 'Rupert') }

    let(:library) { instance_double('Library', collection: YAML.load_file('./lib/data.yml')) }
 
    it 'is expected to have a :name on initialize' do
        expect(subject.name).not_to be nil
    end
    
    it 'is expected to raise error if no name is set' do
        expect { described_class.new }.to raise_error 'A name is required'
    end
    
    it 'can see the TITLE and AUTHOR of all AVAILABLE books' do
        all_books = YAML.load_file('./lib/data.yml')
        available_book_list = all_books.select { |obj| obj[:available] == true  }
        expected_output = available_book_list.map {|book| book.values[0]}
        expect(subject.list_availability).to eq expected_output
    end

end

    # it 'can see a list of all books in the library collection' do
    #     expected_output = YAML.load_file('./lib/data.yml')
    #     expect(subject.check_collection).to eq expected_output
    # end

    # it 'can see a list of all AVAILABLE books in the library collection' do
    #     all_books = YAML.load_file('./lib/data.yml')
    #     expected_output = all_books.select { |obj| obj[:available] == true  }
    #     expect(subject.check_availability).to eq expected_output
    # end




# As a visitor
# In order to choose a book to borrow
# I would like to see a list of books currently available in the library
# with information about the title and author

# As an visitor
# In order to avoid unwanted fines, and to generally do the right thing
# I would like to know when my book is supposed to be returned