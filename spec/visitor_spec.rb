require './lib/visitor.rb'
require 'date'
require 'pry'

 #As a Visitor
 #In order to know which book to borrow
 #I want to the visitor to see a list of available books

 #As a Visitor 
 #In order to be sure I've returned my book successfully
 #I want to receive a message upon completion


describe Visitor do

    subject {described_class.new}

    it 'is expected not to stash any books on initialize' do
        expect(subject.borrowed_book).to be nil
    end


    it 'is expected to see a list of books' do
        expect(subject.list_books).not_to be nil
    end

    it 'is expected to be able to return a book' do
        expected_output = "Thanks for returning the book"
        expect(subject.return_book("soldatpappan")).to eq expected_output
    end

    let(:library) { Library.new }
    it 'is expected to have a list of borrowed books' do 
        library.checkout('soldat')
        binding.pry
        expected_output = YAML.load_file('./lib/receipt.yml')
        expect(subject.borrowed_books).to eq expected_output
    end


end