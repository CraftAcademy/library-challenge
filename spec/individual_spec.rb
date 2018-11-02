require './lib/individual.rb'
require './lib/library.rb'

describe Individual do

    it 'see a list of books currently available in the library' do
        expected_output = {title: 'Harry Potter', author: 'JK Rowling'}
        expect(Library.new.books).to eq expected_output
    end

end