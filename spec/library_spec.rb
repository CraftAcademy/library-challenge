require './lib/library.rb'
require 'date'

describe Library do
    
    it 'booklist' do
        expect(subject.catalogue).to_not eq nil
    end
end