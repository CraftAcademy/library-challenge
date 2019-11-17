require './lib/library.rb'
require 'date'

describe Library do

    it 'populate book list on initialize' do
        expect(subject.collection).not_to be nil
    end

    before { subject.list_books }
    it 'shows a list of all books with author and title' do
        expected_output = 'Pippi Långstrump - Astrid Lindgren (Available)'
        expect(subject.all_books[3]).to eq expected_output
    end

    it 'checks if book is available for checkout' do
        expect { subject.checkout("Skratta lagom! Sa pappa Åberg") }.to raise_error('Selection not available')
    end

    it 'marks a book as checked-out with return date in one month' do
        subject.checkout("Osynligt med Alfons")
        expect(subject.collection[2][:available]).to be false
        expect(subject.collection[2][:return_date]).to eq Date.today.next_month(1).strftime("%Y-%m-%d")
    end

end