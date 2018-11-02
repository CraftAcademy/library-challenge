require './lib/library.rb'
require 'pry'

describe Library do

    it 'expect to add a book with title, author, availability, and empty return date ' do
        subject.add_book({title:'Harry Potter', author: 'JK Rowling'})
        expect(subject.collection).to eq ([{title:'Harry Potter', author: 'JK Rowling', status: 'available', return_date: nil}])
    end

    describe 'checkout' do
        it 'expect to change status to checked-out' do
            subject.checkout_book()
            expect(subject.collection[:status]).to eq 'checked-out'
        end
    end
end