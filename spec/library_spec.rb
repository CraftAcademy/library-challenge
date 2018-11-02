require './lib/library.rb'

describe Library do

    it 'has books' do
        expect(subject.collection).not_to be_empty
    end

    it 'has a list of books' do
        expect(subject.collection).to be_a_kind_of(Array)
    end

end