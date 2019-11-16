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

end