require './lib/library.rb'

describe Library do
    subject {described_class.new}

    it 'Library collection books is not empty'do
        expect(subject.collection_books).not_to be nil
    end


end