require './lib/library.rb'
# require '../lib/books.yml'
require 'date'

describe Library do

    it 'person can view books in collection on initialise' do
        expect(subject.collection).not_to be_nil 
    end


    it 'check if book is available' do
        expect(subject.book_available("Hot Night")).to be true
    end 

    it 'returns false if book is not in collection' do
        expect(subject.book_available("Bible")).to be false
    end

    it 'checkout book' do
    expect(subject.available.checkout(book)).to receive book shelf
    end
end



# it 'check book available in collection' do
#     book.available = true 
# end