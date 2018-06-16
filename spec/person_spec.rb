require 'date'
require './lib/person.rb'

describe
    it 'there is a list of books on initialize' do
        expect(subject.books).to eq true
    end