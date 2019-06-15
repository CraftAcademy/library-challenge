require './lib/librarycard.rb'
require 'date'

describe Card do
    let(:person) { instance_double('Person', name: "Fluffins") }
    
    subject { described_class.new({owner: person}) }

    it 'is expected to have an owner' do
        expect(subject.owner).to eq person
    end

end

