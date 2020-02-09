require './lib/person.rb'

describe Person do
    
    subject { described_class.new }

    it 'Checks if you can create a person' do
        subject.set_username('Robin')
        expect(subject.username).to_not eq nil
    end

end