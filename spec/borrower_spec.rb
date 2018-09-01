require './lib/borrower'
require './lib/library.rb'
require 'date'
require 'yaml'

describe Borrower do
    subject { described_class.new("Robin") }
    
    it 'should have a name' do
        expect(subject.name).to eq "Robin"
    end

    it 'should raise error if no name is given' do        
        expect { described_class.new }.to raise_error 'You must provide a name when you create a Borrower'
    end
end