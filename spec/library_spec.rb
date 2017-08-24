require './lib/library.rb'
require 'date'

describe Library do

    it 'YAML file should be loaded in book_list' do
      substitude = lambda {subject.books[0][:item][:author]}
      expect(substitude.call).to eq 'Terry Pratchett'
    end
end
