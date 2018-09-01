require './lib/library.rb'

describe Library do
    it 'has a collection of books' do
        expect(subject.books).not_to be nil
    end
end

