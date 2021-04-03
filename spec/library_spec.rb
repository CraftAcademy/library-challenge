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

    it 'can pull individual book from book_list' do
        subject.read_book_list
        expected_outcome = {:item=>{:title=>"Foundation", :author=>"Isaak Asimov"}, :avalible=>false, :return_date=>"2021-05-03"}
        expect(subject.pull_book({title: 'Foundation'})).to eq expected_outcome
    end

    it 'returns error if no title is given to pull_book method' do
        subject.read_book_list        
        expect{ subject.pull_book }.to raise_error(RuntimeError, "Specify the title of book to pull")
    end

end