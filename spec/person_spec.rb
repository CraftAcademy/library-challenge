require './lib/person'

describe Person do
    subject { described_class.new(name: 'Thomas') }
    
    it 'is expected to have a name initilazed' do
        expect(subject.name).not_to be nil
    end

    # it 'is expected to be able to checkout books' do
        
    # end

    
  
end