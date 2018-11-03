require './lib/person.rb'
require './lib/library.rb'
require 'pry'

describe Person do
    let(:lib) {Library.new}
    subject {described_class.new(name:'Thomas')}

    it'expect to have name on initilize' do
        expect(subject.name).to eq 'Thomas'
    end

    it 'expect to raise error when no name is inserted' do
        expect {described_class.new}.to raise_error('Missing name')
    end

    it 'adds the book to rented book when renting' do
        lib.add_book({title:'Harry Potter', author: 'JK Rowling'})
        subject.rent_book(lib:lib, title:'Harry Potter')
        expect(subject.rented_books).to eq [{title:'Harry Potter',author:'JK Rowling', return_date: Date.today + 30}]
    end

    it 'rent the book it will not appear as available in Library' do
        lib.add_book({title:'Harry Potter', author: 'JK Rowling'})
        subject.rent_book(lib:lib, title:'Harry Potter')
        expect(lib.available_books).to eq ([])
    end

    it 'return book when using return method' do
        lib.add_book({title:'Harry Potter', author: 'JK Rowling'})
        subject.return_book(lib:lib, title:'Harry Potter')
        expect(subject.rented_books).to eq []
    end

    it 'returned book appears as available book' do
        lib.add_book({title:'Harry Potter', author: 'JK Rowling'})
        subject.return_book(lib:lib, title:'Harry Potter')
        expect(lib.available_books).to eq ([{title:'Harry Potter', author: 'JK Rowling', status: 'available', checked_out_to: nil, return_date: nil}])
    end
end