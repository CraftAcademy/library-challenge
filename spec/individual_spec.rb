require './lib/individual.rb'
require './lib/library.rb'

describe Individual do

    it 'see a list of books currently available in the library' do
        expected_output = ['Harry Potter', 'Gatsby', 'Alien']
        expect(subject.titles_available).to eq expected_output
    end

end