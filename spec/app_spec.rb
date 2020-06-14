require 'yaml'
require './lib/app'
require 'date'

describe App do
    
    it 'have a collection on initialize' do
        expected_output = YAML.load_file('./lib/data.yml')
        expect(subject.collection).to eq expected_output
    end

    it 'book is checked out' do
        subject.book_checkout obj
        expect(subject.collection).to eq 
    end
end