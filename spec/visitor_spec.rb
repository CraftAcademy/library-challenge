require './lib/visitor.rb'
require 'date'
require 'pry'

 #As a Visitor
 #In order to know which book to borrow
 #I want to the visitor to see a list of books

 #As a Visitor 
 #In order to check my current book-status with the library
 #I always want to be able to check my App-file

  
 #As a Visitor 
 #To be sure that I have returned a book
 #I want to receive a message upon succesfully returning my book

describe Visitor do

    subject {described_class.new}

    it 'is expected not to stash any books on initialize' do
        expect(subject.borrowed_book).to be nil
    end

    it 'is expected to see a list of books' do
        expect(subject.list_books).not_to be nil
    end

    let(:library) { Library.new }
    it 'is expected to be able to return a book' do
        library.checkout('soldat')
        expected_output = "Thanks for returning the book"
        expect(subject.return_book("soldatpappan")).to eq expected_output
    end

    let(:library) { Library.new }
    it 'is expected to have a list of borrowed books' do 
        library.checkout('soldat')
        expected_output = YAML.load_file('./lib/receipt.yml')
        expect(subject.borrowed_books).to eq expected_output
    end


end