require './lib/librarycard.rb'
require 'date'

describe Card do
    let(:person) { instance_double('Person', name: "Fluffins") }
    
    subject { described_class.new({owner: person}) }

    it 'is expected to have an owner' do
        expect(subject.owner).to eq person
    end

    it 'is expected to raise an error if no owner is set' do
        expect { described_class.new }. to raise_error 'An owner for the library account card is required'
    end

    it 'checks for a card number' do
        expect(subject.number).not_to be nil
    end
end

