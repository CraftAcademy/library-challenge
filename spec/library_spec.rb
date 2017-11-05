require './lib/library.rb'
#require 'date'

describe Library do
  let(:oliver) {instance_double('Person', name: 'Oliver', books: [])}

  it { is_expected.to respond_to :checkout_book }

  it 'expects to have a collection of books on initialize' do
    expect(subject.collection).not_to be nil
  end

  it 'expects to be able to present the collection of available books to individuals' do
    expect(subject.collection).to be_kind_of Array
  end

  describe '#checkout_book' do
    before do
      @book_to_checkout = subject.collection[0]
      #person withdraws a book
      subject.checkout_book(@book_to_checkout, oliver)
    end
    it 'changes availability of checked out book to false' do
      #if he withdraws a book then the book should be unavailable
      expect(subject.collection[0][:available]).to eq false
    end

    it 'adds one book to persons book collection' do
      expect(oliver.books.size).to eq 1
    end

    it 'adds the checked out book to persons book collection' do
      expect(oliver.books).to include @book_to_checkout[:item]
    end
  end
end
