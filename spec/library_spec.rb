
require './lib/library.rb'
# As a programmer            
# So that the game can be played according to the rules            
# I want a normal number to return that number

describe Library do
    
    it 'Finds the library empty' do
        expect(subject.collection).to eq nil
    end

    it 'finds if the library has books in stock' do
        subject.addBook('Hejsan', 'Janko')
        expect(library).to_not eq nil
    end

end