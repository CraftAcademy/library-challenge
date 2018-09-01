require './lib/visitor.rb'

describe Visitor do

    subject { described_class.new(name: 'Rupert') }

    it 'is expected to have a :name on initialize' do
        expect(subject.name).not_to be nil
    end
    
    it 'is expected to raise error if no name is set' do
        expect { described_class.new }.to raise_error 'A name is required'
    end

end

# As a visitor
# In order to choose a book to borrow
# I would like to see a list of books currently available in the library
# with information about the title and author

# As an visitor
# In order to avoid unwanted fines, and to generally do the right thing
# I would like to know when my book is supposed to be returned