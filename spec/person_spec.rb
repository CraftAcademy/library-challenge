require 'yaml'
require 'date'
require './lib/person.rb'

describe Person do

    it 'initializes a instance of Person without books' do
    expect(subject.books).to eq nil
    end

    it 'loan a book' do

    end

    it 'get a return date 30 days from loan'  do

    end

    it 'has a list of loaned books with return date' do

    end

end