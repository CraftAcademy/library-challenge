require './lib/library.rb'
require 'pry'


describe Library do
    subject {described_class.new}
    

    it 'Library collection books is not empty' do
    expect(subject.collection_books).not_to eq nil
    end

    it 'List of available books' do
    expect(subject.books_is_available?).to_not eq [{:available => false}]
    end

    it 'Gets author' do
    expect(subject.collection_books[0][:item][:author]).to eq 'Gunilla Bergström'
    
    end
    
    it 'List of borrowed books' do
        expect(subject.books_is_unavailable?).to_not eq [{:available => true}]
    
    end
    
    it 'Search a book by the title' do
        expect(subject.search_book_title("Pipi")).to eq         
    end

  

    it 'Checks avaliability' do
        expect(subject.collection_books[0][:available]).to eq true
    end





    #it 'List of books avaible' do
    #expect_output ={book_title: '', status: true}
    #expect(subject.collection_books).to eq expect_output
    #end



end