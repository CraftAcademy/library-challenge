require './lib/library.rb'
require 'date'

describe Library do

    it 'populate book list on initialize' do
        expect(subject.collection).not_to be nil
    end


end