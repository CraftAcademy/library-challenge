require './lib/library.rb'
require 'date'

describe Library do
  
    it 'checks if on initialize book_list var is nil' do
        expect(subject.book_list).to be nil
    end

    it 'reads book.yml as an object' do
        subject.read_book_list
        expect(subject.book_list).not_to be nil
    end

    

end