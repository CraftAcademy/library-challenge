require 'date'
require './lib/book.rb'
require './lib/person.rb'

describe Book do
    subject {described_class.new({item:{title: 'Alfons och soldatpappan', author: 'Gunilla Bergström', category: 'Children'}})}

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
        subject.checkout(person)
        expect(subject.available).to eq false
    end

    it 'Book can not be check out if not available' do
        subject.checkout(person)
        expect{subject.checkout(person)}.to raise_error 'Book not available'
    end

    it 'Book must be available after return' do
        subject.checkout(person)
        subject.return_book
        expect(subject.available).to eq true
       
    end

    it 'Gives out receipt after checkout' do
        receipt = {title: subject.title, today_date: Date.today, return_date: Date.today.next_day(Book::DEFAULT_LOAN_DURATION_DAYS).strftime('%d/%m/%y')}
        expect(subject.checkout(person)).to eq receipt
    end

end