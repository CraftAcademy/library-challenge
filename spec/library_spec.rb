require './lib/library.rb'

describe Library do

    it 'has a collection of books' do
        expect(subject.books[:title]).to eq 'Harry Potter'
    end

end

