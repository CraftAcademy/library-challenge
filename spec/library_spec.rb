require './lib/library.rb'

describe Library do
    
    let(:visitor) { instance_double('Visitor', username: 'Noel', password: 'Ryan') }
  

    it 'Whole collection of books in library' do
        expect(subject.collection).not_to eq nil
    end
    
    it 'searching a title should return a list of Librarys books' do   
        expect(subject.search("Pippi")).to have_attributes(:name => a_string_starting_with("P"))
    end

    it 'Availibilty should be updated to false when book has been checkout' do 
        expect(subject.collection.availibilty).to eq false
    end


end

