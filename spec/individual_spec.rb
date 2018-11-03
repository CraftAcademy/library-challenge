require './lib/individual.rb'
require './lib/library.rb'
require 'date'

describe Individual do

    

    it 'see a list of books currently available in the library' do
        expected_output = ['Harry Potter', 'Gatsby', 'Alien']
        expect(subject.titles_available).to eq expected_output
    end
    
    let(:library) {Library.new}

    it 'can see when a book is meant to be returned' do
        library.checkout('Harry Potter')
        expected_output = "The book needs to be returned on 2013-10-33"
        expect(subject.when_to_return_book('Harry Potter')).to eq expected_output
    end

end