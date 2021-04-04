require './lib/keeper.rb'
require 'date'
describe Keeper do
    let(:visitor) { instance_double('Visitor', rented_books: []) }
    
    it 'keeeper checks if he has a list of the books' do
        expect(subject.list).not_to be nil
    end
    it 'keeeper can check the availability of a specific title' do
            expect(subject.check_availability('Mathew')).to be true
    end
    
end