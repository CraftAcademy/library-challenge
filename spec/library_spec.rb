require './lib/library.rb'

describe Library do
    it 'have books in library' do
        expect(subject.collection).not_to eq nil
    end
end
