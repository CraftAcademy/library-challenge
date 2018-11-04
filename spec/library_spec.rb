require './lib/library.rb'
require 'date'

describe Library do

    it 'has a collection of books' do
        expected_output = ['Alfons och soldatpappan', 'Skratta lagom! Sa pappa Åberg', 'Osynligt med Alfons', 'Pippi Långstrump', 'Pippi Långstrump går ombord' ]
        expect(subject.display_books).to eq expected_output
    end

    it 'allows individual to check out a book if available' do
        expected_output = 'The book is yours'
        expect(subject.checkout('Alfons och soldatpappan')).to eq expected_output
    end

    it 'disallows individual to checkout a book if not available' do
        subject.checkout('Alfons och soldatpappan')
        expected_output = 'The book is unavailable'
        expect(subject.checkout('Alfons och soldatpappan')).to eq expected_output
    end

    it 'sets a 1 month return date on every check out' do
        subject.checkout('Alfons och soldatpappan')
        expected_output = Date.today.next_month(1)
        expect(subject.return_date?('Alfons och soldatpappan')).to eq expected_output
    end

end

