require './lib/book.rb'
require 'Date'

describe Book do
    it 'has an author' do
        expect(subject.author).to eq(:author)
    end

    it 'has a title' do
        expect(subject.title).to eq (:title)
    end

    it 'has a 30 day return date from check-out' do
        expected_date = Date.today.next_day(30).strftime('%d/%m/%y')
        expect(subject.return_date).to eq expected_date
    end

    it 'is expected to have :available status on initialize' do
        expect(subject.book_status).to eq :available
    end

    it 'is not available when checked-out' do
        Book.unavailable(subject)
        expect(subject.book_status).to eq :unavailable
    end
end
