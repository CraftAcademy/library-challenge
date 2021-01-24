require './lib/visitor.rb'
require 'date'


describe Visitor do
    
    it 'has an attribute of rented books on initialize, that is an empty array' do
        expect(subject.rented_books).to eq []
    end

end