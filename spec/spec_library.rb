require './lib/library.rb'
require 'pry'
require 'yaml'


describe Library do
    subject {described_class.new}

    
# 1
    it 'Library collection books is not empty' do
        expect(subject.collection_books).not_to eq nil
    end

# 2
    it 'List of available books' do
        expect(subject.books_is_available?).to_not eq [{:available => false}]
    end

# 3
    it 'List of borrowed books' do
        expect(subject.books_is_unavailable?).to_not eq [{:available => true}]
    end

# 4
    it 'Search a book by the title' do
        expect(subject.search_book_title("Osynligt")).not_to include ("Långstrump")
    end

# 5
    it 'Search a book by the author' do
        expect(subject.search_book_author("Gunilla")).not_to include ("Astrid Lindgren")        
    end

# 6
    it 'Is expected to give the return date' do
        expected_date = Date.today + 30
        expect(subject.time_out).to eq expected_date
    end

# 7
    it 'Checks if the book has been borrowed' do
        subject.borrow_book(0)
        expect(subject.collection_books[0][:available]).to eq false
    end

# 8
    it 'Checks if the book has been returned' do
        subject.return_book(0)
        expect(subject.collection_books[0][:available]).to eq true
    end

#9
    it 'Checks if the date has been added into the borrowed book' do
        subject.borrow_period(0)
        expect(subject.collection_books[0][:return_date]).to_not eq nil
    end

#10
    it 'Checks if the date has been added into the borrowed book' do
        subject.return_book_date(0)
        expect(subject.collection_books[0][:return_date]).to eq nil
    end

end