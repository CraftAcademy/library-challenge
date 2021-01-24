require './lib/librarian.rb'
require 'date'

describe Librarian do

    it 'librarian checks if he has a list of the books' do
    expect(subject.list).not_to be nil
    end

    it 'librarian can check the availability of a specific title' do
    expect(subject.check_availability('Big Fish')).to be true
    end
    

    
end