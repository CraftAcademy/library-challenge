require 'yaml'
require 'date'
require './lib/person.rb'

describe Person do

    it 'initializes a instance of Person without books' do
    expect(subject.books_person).to eq []
    end

    xit 'loan a book' do

    end

    xit 'get a return date 30 days from loan'  do

    end

    xit 'has a list of loaned books with return date' do

    end

end