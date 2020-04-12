require 'date'
require './lib/book.rb'
require './lib/person.rb'
require './lib/library.rb'

describe Book do
    let(:lib) {Library.new}
    subject { described_class.new({item:{title: 'Alfons och soldatpappan', author: 'Gunilla Bergström', category: 'Children'},library:lib}) }

    let(:person) { Person.new(name: "Person") }

    it 'must have a title' do
        expect {described_class.new({item:{author: "someone", category: 'Children'}})}.to raise_error 'Book must have a title'
    end

    it 'must have an author' do
        expect {described_class.new({item:{title: "something", category: 'Children'}})}.to raise_error 'Book must have an author'
    end

    it 'must have a category' do
        expect {described_class.new({item:{title: "something", author: 'Someone'}})}.to raise_error 'Book must have a category'
    end

    it 'Book must not be available after checkout' do
        # As a visitor
        # In order to loan a book
        # I need to checkout the book from library
        subject.checkout(person)
        expect(subject.available).to eq false
        subject.return_book
    end

    it 'Book can not be check out if not available' do
        subject.checkout(person)
        expect{subject.checkout(person)}.to raise_error 'Book not available'
    end

    it 'Book must be available after return' do
        # As a visitor
        # In order to return books before due time
        # I need to able to return book to library collection 
        subject.checkout(person)
        subject.return_book
        expect(subject.available).to eq true
       
    end

    it 'Gives out receipt after checkout' do
        receipt = {book:subject, receipt: {title: subject.title, checkout_date: Date.today.strftime('%d/%m/%y'), return_date: Date.today.next_day(Book::DEFAULT_LOAN_DURATION_DAYS).strftime('%d/%m/%y')}}
        subject.checkout(person)
        expect(person.receipts[0]).to eq receipt
    end

    it 'cannot be checked out by an inactive user' do
        # As a library owner
        # In order to make sure books are not lost
        # I want to keep unauthorized people from loaning books
        expect{ subject.checkout( Person.new({name: "Adolf", active: false})) }.to raise_error 'Person is not allowed to loan books'
    end

end