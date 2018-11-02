require './lib/library.rb'

describe Library do

    it 'has books' do
        expect(subject.collection).not_to be_empty
    end

    it 'has a list of books' do
        expect(subject.collection).to be_a_kind_of(Array)
    end 
    it 'shows list of availible books' do
        expected_outcome = collection.detect { |obj| obj[:item][:availible] == true}
        expect(subject.collection).to match expected_outcome
    end

end