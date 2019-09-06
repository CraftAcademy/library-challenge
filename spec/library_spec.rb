require './lib/library.rb'

describe Library do
    
    it 'has the ability to show list of checked-out books' do
        expect(subject.collection).to include{:item}
    end

    #WIP
    it 'change_available_status to change availability to false' do
        expect(subject.collection[0][:available]).to eq false
    end
end
