require './lib/library.rb'
require 'pry'

describe Library do

before do
    subject.add_book({title:'Harry Potter', author: 'JK Rowling'})
end
    it 'expect to add a book with title, author, availability, and empty return date ' do
        expect(subject.collection).to eq ([{title:'Harry Potter', author: 'JK Rowling', status: 'available', return_date: nil}])
    end

    it'expect to see available books with available_books method' do
        expect{subject.available_books}.to eq ({title:‘Harry Potter’, author: ‘JK Rowling’})
    end

    describe 'checkout' do
        it 'expect to change status to checked-out' do
            subject.checkout_book("Harry Potter")
            expect(subject.collection[0][:status]).to eq 'checked-out'
        end
        it 'expect to change the return date to 30 days from now' do
            subject.checkout_book("Harry Potter")
            expect(subject.collection[0][:return_date]).to eq Date.today + 30
        end
    end
end