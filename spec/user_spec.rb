require './lib/library.rb'
require './lib/user.rb'
require 'date'
require 'yaml'

describe User do
    
    subject { described_class.new(name: 'Jenny', account: :active) }
    
    it 'is expected to have a :name on initialize' do
        expect(subject.name).not_to be nil
    end
    
    it ' is expected to raise an error if no name is set' do
        expect { described_class.new }.to raise_error 'A name is required'
    end

    it 'searches for a book title in collection' do
      expect(subject.search_book('Pippi Långstrump') ).to include(include(:available))
    end
    it 'searches for a book author in collection' do
      expect(subject.search_book('Astrid Lindgren') ).to include(include(:available))
    end
    it 'searches for a book author not in the collection' do
      expect(subject.search_book('Strindberg') ).to eq 'no such book'
    end
    it 'checks out a book in the collection' do
        expect(subject.check_out_book('Madicken')).to include(available: false, return_date: Date.today.next_month(1).strftime("%Y/%m/%d"))
    end
    it 'checks in a book in the collection when returned' do
        expect(subject.check_in_book('Madicken')).to include(available: true, return_date: nil)
      end
      it 'displays a message telling user that the book is unavailable' do
        expect(subject.check_out_book('The Girl')).to match(/Book not availible right now, back in library/)
      end
    
    
end