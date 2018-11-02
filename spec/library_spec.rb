require './lib/library.rb'
require 'pry'

describe Library do

    it 'expect to add a book with title, author, availability, and empty return date ' do
        subject.add_book({title:'Harry Potter', author: 'JK Rowling'})
        expect(subject.book).to eq ({title:'Harry Potter', author: 'JK Rowling', availability: 'available', return_date: nil})
    end

end