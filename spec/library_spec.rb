require './lib/library.rb'

describe Library do
    it 'has a collection of books' do
        expect(subject.books).not_to be nil
    end

    it 'can provide user with a list of available books' do
        expect(subject.available_books).not_to be nil
    end

end

