require './lib/library.rb'
require 'pry'

describe Library do
    subject {described_class.new}

    it 'Library collection books is not empty'do
    
    expect(subject.collection_books).not_to eq nil
    end

    it 'Gets book through title' do
    expect(subject.collection_books[0][:item][:title]).to eq 'Alfons och soldatpappan'
    end

    it 'Gets author' do
    expect(subject.collection_books[0][:item][:author]).to eq 'Gunilla Bergström'
    end

    it 'Checks avaliability' do
        expect(subject.collection_books[0][:available]).to eq true
    end





    #it 'List of books avaible' do
    #expect_output ={book_title: '', status: true}
    #expect(subject.collection_books).to eq expect_output
    #end



end