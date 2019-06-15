require './lib/library.rb'

describe Library do

    it 'loads a collection of books upon initialize' do
        expect(subject.test_library).to eq 1234
    end

    it 'has to have 10 books' do
        expect(subject.books).to eq 10
    end
end