require './lib/library.rb'

describe Library do
    it 'has books' do
        expect(subject.collection).not_to eq nil
    end

end