require './lib/library.rb'

describe Library do 

    subject {described_class.new}

    it 'to see that the library has a list of books' do 
        expect(subject.collection).to_not eq nil
    end 

    it 'to search for a specific book' do
        expect(subject.collection[2][:item][:author]).to eq 'Fatima Bremmer'
    end
end 