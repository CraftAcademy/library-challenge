require './lib/librarian.rb'
require 'date'

describe Librarian do

    it 'librarian checks if he has a list of the books' do
    expect(subject.list).not_to be nil
    end

    it 'librarian can check the availability of a specific title' do
    expect(subject.check_availability('Big Fish')).to be true
    end
    
    describe 'check_out method' do
        
        it 'it changes availability' do
            title = 'Big Fish'
            subject.check_out(title)
            expect(subject.check_availability(title)).to eq false
        end

        it 'it sets a return date on the book' do
            title = 'Big Fish'
            subject.check_out(title)
            expect(sub)
        end

    end

    
end