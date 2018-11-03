require './lib/person.rb'

describe Person do

    it 'is expected visitor to have a name' do
        expect(subject).to require_to(:name)
    end
end