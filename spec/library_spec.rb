require 'yaml'
require './lib/library.rb'

#collection = YAML.load_file('./lib/booksdb.yml')

describe Library do
  let(:patron) {double('Patron')}

  it 'should have the list of books' do
    expect(subject.bookrack).not_to be nil
  end

  it 'should check if the book is available' do
     expect(subject.bookrack[0][:available]).to be true
  end

  it 'should return error if book not available' do
     expect{subject.check_book_availability(100)}.to raise_error('Book not available')
  end

  describe "Checked-out process:" do
  before {subject.check_book_availability(0)}
    it 'can checkout book to patron and update the bookrack' do
      expect(subject.bookrack[0][:available]).to be false
    end
  end

  describe 'Returning of books process:' do
    before {subject.receive_book_returned_by_patron(0)}
      it 'it can update the availability of book to true' do
        expect(subject.bookrack[0][:available]).to be true
      end
  end
end
