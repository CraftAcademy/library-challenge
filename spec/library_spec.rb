require './lib/library.rb'

describe Library do

    it 'has a collection of books' do
        find_title = subject.books.find { |book| book[:title] }[:title]
        expect(find_title).to eq 'Harry Potter'
    end

    it 'allows individual to check out a book if available' do
        expected_output = 'The book is yours'
        expect(subject.checkout('Harry Potter')).to eq expected_output
    end

end

