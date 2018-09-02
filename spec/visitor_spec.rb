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
        subject.request_checkout("Bravo Two Zero")
        expected_output = @visitor_bookshelf
        expect(subject.update_bookshelf).to eq expected_output
    end

    it 'can see the return date of books on its bookshelf' do
        subject.request_checkout("Bravo Two Zero")
        expected_output = Date.today.next_month(1).strftime('%d/%m/%y')
        expect(subject.check_return_date("Bravo Two Zero")).to eq expected_output
    end

end
