require './lib/keeper.rb'
require 'date'
describe Keeper do
    let (:books) { YAML.load_file('./lib/data.yml') }

    it 'is expected to have books on initialized' do
      expect(subject.books).to eq books
    end
  
    it 'is able to search books by titles' do
      found_book = {book: {title: 'Mathew', author: 'Apostle-Mathew'}}
      subject.books = [
        found_book,
        {book: {title: 'Genesis', author: 'Moses'}}
      ] 
      result = subject.search({title:'Mathew'})
      expect(result).to eq [found_book]
    end
    it 'is able to search books by authors' do
        found_book = {book: {title: 'Mathew', author: 'Apostle-Mathew'}}
        subject.books = [
          found_book,
          {book: {title: 'Genesis', author: 'Moses'}}
        ]
        result = subject.search({author: 'Apostle-Mathew'})
        expect(result).to eq [found_book]
      end
      
      
      it 'is expected to provide a list of books' do
        expect(subject.list_of_books).to eq books
      en