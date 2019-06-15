require './lib/librarian.rb'
require 'pry'


describe Librarian do

    it 'has to have 10 books' do
        expect(subject.books).to eq 10
    end

    it 'has a search function' do
        book_info = {title: 'title', author: 'author'}
        expect(subject.search_books('title', 'author')).to eq book_info
    end

    it 'has to be able to check out books' do
        receipt = {title: 'title', author: 'author', date: Date.today}
        expect(subject.checkout_books('title', 'author')).to eq receipt
    end
end