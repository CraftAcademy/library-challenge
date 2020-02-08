require './lib/account.rb'
require 'date'
require './lib/data.yml'
require './lib/books.rb'

describe Books do
    it 'has a collection of books on initialize' do 
        expect(subject.books).to_return 'Books'
    end
    
end
