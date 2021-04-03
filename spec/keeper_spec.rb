require './lib/keeper.rb'
require 'date'
describe Keeper do
    it 'keeeper checks if he has a list of the books' do
        expect(subject.list).not_to be nil
    end
  
end