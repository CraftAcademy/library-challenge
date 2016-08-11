require './lib/library.rb'

describe Library do
  let(:patron) {double('Patron')}

  it 'has a working bookshelf' do
    expect(subject.bookshelf).not_to be nil
  end

  it 'can identify if books are available' do
    expect(subject.bookshelf[1][:available]).to be false
  end

  it 'returns error if book not found' do
    expect{subject.release_book_to_patron(999)}.to raise_error('Book not found')
  end

  describe 'working with checked-out books' do

    before {subject.release_book_to_patron(0)}
    it 'can release a book for checkout and update bookshelf' do
      expect(subject.bookshelf[0][:available]).to be false
    end

    it 'can put a due date on a checked-out book' do
      expect(subject.bookshelf[0][:due_date]).to eq subject.set_due_date
    end
  end

  describe 'working with a returned book' do

    before {subject.receive_returned_book(0)}
    it 'can mark a returned book as available' do
      expect(subject.bookshelf[0][:available]).to be true
    end

    it 'resets due date on returned book' do
      expect(subject.bookshelf[0][:due_date]).to be nil
    end
  end
end
