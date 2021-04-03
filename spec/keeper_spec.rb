require './lib/keeper.rb'
require 'date'
describe Keeper do
    it 'keeeper checks if he has a list of the books' do
        expect(subject.list).not_to be nil
    end
    it 'keeeper can check the availability of a specific title' do
            expect(subject.check_availability('Big Fish')).to be true
    end
    
end