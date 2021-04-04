require './lib/keeper.rb'
require 'date'
require './lib/customer.rb'


describe Customer do
    let(:keeper) { Keeper.new }

    it 'has an attribute of rented books on initialize, that is an empty array' do
        expect(subject.rented_books).to eq []
    end

end