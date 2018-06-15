# require '.lib/data.yml'
require './lib/person.rb'

describe Person do

    it 'is expected to be books on initialize' do
        expect(subject.books).to eq true
    end

    



end

