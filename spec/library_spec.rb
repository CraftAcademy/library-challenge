require './lib/library.rb'
require 'yaml' #maybe needs to be here?
require 'date'

describe Library do
    #not sure about this 1
    it 'book is avalible' do
        expect(subject.avalible).to eq true
        else #else not avalible maybe.
        expected(subject.avalible).to eq false
    end

    it 'expected to have a return date' do #do we call specific return dates?
        expected_date = Date.today.next_week(5)
        expect(subject.next_week).to eq expected_date
    end # simmillar to atm challenge , might work. 

end