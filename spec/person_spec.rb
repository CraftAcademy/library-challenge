# require '.lib/data.yml'
require './lib/person.rb'

describe Person do

    subject { described_class.new(name: 'Thomas') }

    before do
        allow(library).to receive(:collection=)
        end

    
    it 'is expected that a Person has a collection of books' do
    #expected_output = { status: true, message: 'Person have books loaned from the library' }
        expect(subject.collection.detect).to eq expected_output
    end

    it 'is expected to have available books'do
    #expected_output { status: true, message: 'Books are available', date: Date.today }
    expect(subject.collection).to eq 
    end




end

