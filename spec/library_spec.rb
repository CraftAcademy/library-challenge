require './lib/library.rb'

describe Library do
    
    it 'has the ability to show list of checked-out books' do
        expect(subject.collection).to include{:item}
    end

    it 'change_available_status to change availability to false' do
        expect(subject.collection[0][:available]).to eq false
    end

    it 'can search for author by input of argument' do
        subject.search_by_author("astrid")
        expect(subject).to be_truthy
    end

    it 'can search for title by input of argument' do
        subject.search_by_title("pippi")
        expect(subject).to be_truthy
    end
end
