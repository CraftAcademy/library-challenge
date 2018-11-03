require './lib/individual.rb'
require './lib/library.rb'
require 'date'

describe Individual do

    

    it 'see a list of books currently available in the library' do
        expected_output = ['Alfons och soldatpappan', 'Osynligt med Alfons', 'Pippi Långstrump', 'Pippi Långstrump går ombord' ]
        expect(subject.titles_available).to eq expected_output
    end
    
    let(:library) {Library.new}

    it 'can see when a book is meant to be returned' do
        # library.checkout('Skratta lagom! Sa pappa Åberg')
        expected_output = "The book needs to be returned on 2016-05-25"
        expect(subject.when_to_return_book('Skratta lagom! Sa pappa Åberg')).to eq expected_output
    end

end