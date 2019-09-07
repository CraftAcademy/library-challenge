require './lib/book.rb'
require 'date'

describe Book do

    it 'has an author' do
        expect(subject.author).to eq (:author)
    end

    it 'has a title' do
        expect(subject.title).to eq (:title)
    end

    it 'is expected to be :available on initialize' do
        expect(subject.status).to eq (:available)
    end

    it 'is expected to be unavailable when checked out' do
        subject.book_unavailable?
        expect(subject.status).to eq (:unavailable)
    end

    it 'is expected to know when to return a book' do
        expected_date = Date.today.next_month(1).strftime("%d/%m")
        expect(subject.return_date).to eq expected_date
    end
   
end