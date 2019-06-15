require "./lib/library.rb"

describe Library do
    
    it 'must have books' do
        expect(subject.books).to eq 10
    end

end