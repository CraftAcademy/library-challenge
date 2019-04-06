require './lib/library.rb'

describe Library do

    it 'should have a collection of books when initialized' do
    expect(subject.collection).to be_truthy
    end

    


end



