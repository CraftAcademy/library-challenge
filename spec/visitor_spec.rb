require './lib/visitor.rb'
require './lib/library.rb'
require 'yaml'

describe Visitor do

    subject { described_class.new(name: 'Rupert') }

    let(:library) { instance_double('Library', collection: YAML.load_file('./lib/data.yml'), visitor_bookshelf: []) }
 
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

    it 'can request to checkout a book which moves to their bookshelf' do
       
    end

    # it 'can see the return date of books on its bookshelf' do

    # end

end

# As an visitor
# In order to avoid unwanted fines, and to generally do the right thing
# I would like to know when my book is supposed to be returned