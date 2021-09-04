require './lib/library'

describe Library do

    it 'is expected to contain books' do
        expect(subject.available_books).to be_truthy
    end


  
end