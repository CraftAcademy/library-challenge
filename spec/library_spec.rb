require './lib/library.rb'
require 'yaml'

describe Library do

    let(:visitor) { instance_double('Visitor', name: 'Rupert') }
 
    it 'has a collection of books in the library on initialize' do
        expected_output = YAML.load_file('./lib/data.yml')
        expect(subject.collection).to eq expected_output
    end

    it 'can access a list of all books in the library collection' do
        expected_output = YAML.load_file('./lib/data.yml')
        expect(subject.collection_list).to eq expected_output
    end

    it 'can see a list of all AVAILABLE books in the library collection' do
        all_books = YAML.load_file('./lib/data.yml')
        expected_output = all_books.select { |obj| obj[:available] == true  }
        expect(subject.list_availability).to eq expected_output
    end

    it 'can see if a specific book is available in the collection' do
        all_books = YAML.load_file('./lib/data.yml')
        expected_output = all_books.any? { |obj| obj[:item][:title] == 'Bravo Two Zero' && obj[:available] == true}
        expect(subject.check_availability('Bravo Two Zero')).to eq expected_output
    end

    it 'is expected to gives books a return date 1 month from checkout' do
        exp_return_date = Date.today.next_month(1).strftime('%d/%m/%y')
        expect(subject.set_return_date).to eq exp_return_date
    end

    it 'can checkout book and create receipt with correct return date' do  
        expected_output = {title: 'Bravo Two Zero', message: 'Book now checked out', date_of_return: Date.today.next_month(1).strftime('%d/%m/%y')}
        expect(subject.checkout('Bravo Two Zero')).to eq expected_output
    end

    # it 'can update availability for a book at checkout' do  
    #     subject.checkout('Bravo Two Zero') 
    #     expect(subject.check_availability('Bravo Two Zero')).to eq false
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