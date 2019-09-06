require './lib/library.rb'

describe Library do
    
    it 'has the ability to show list of checked-out books' do
        expect(subject.collection).to include{:item}
    end
end
