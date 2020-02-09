require './lib/person.rb'

describe Person do
    let(:person) { Person.new() }

    subject { described_class.new }

    it 'Checks if you can create a person' do
        expect(subject).to be_a Person
    end

    it 'Checks if you can create a person and set a username' do
        subject.set_username('Robin')
        expect(subject.username).to_not eq nil
    end

    it 'Checks if you can create a person and set a persona_id' do
        subject.set_username('Robin')
        expect(subject.username).to_not eq nil
    end

end