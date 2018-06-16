require 'yaml'
require './lib/library'

describe Library do

    it 'make a Library with books' do
        expect(subject).to be_an_instance_of Library
    end

    it 'search for books in the inventory' do
        expect(subject.find_book(args={})).to eq true
    end

end
