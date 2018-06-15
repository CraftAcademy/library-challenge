# require '.lib/data.yml'
require './lib/person.rb'

describe Person do
    
let(:library) { instance_double('Person', collection: )}


    it 'is expected to be books on initialize' do
        expect(subject.books).to eq true
    end

    it 'is expected that a Person has books' do
    expect(subject.loaned).to be true
    end




end

