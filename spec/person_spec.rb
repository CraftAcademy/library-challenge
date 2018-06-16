require 'yaml'
require 'date'
require './lib/person.rb'

describe Person do

    it 'initializes a instance of Person without books' do
    expect(subject.books).to eq nil
    end

end