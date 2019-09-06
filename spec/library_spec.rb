require './lib/library.rb'

describe Book do
    it 'has an author' do
        expect(subject.author).to eq(:author)
    end

end
