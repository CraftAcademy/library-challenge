require './lib/visitor.rb'
require 'date'
require 'pry'

 #As a Visitor
 #In order to know which book to borrow
 #I want to the visitor to see a list of available books


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


end