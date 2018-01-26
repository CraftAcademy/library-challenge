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
    let(:expected_return_date) { Date.today.next_month.strftime('%Y-%m-%d') }

    before do
      @book_to_checkout = subject.collection[0]
      subject.checkout_book(@book_to_checkout, oliver)
    end

    it 'changes availability of checked out book to false' do
      expect(@book_to_checkout[:available]).to eq false
    end

    it 'adds one book to persons book collection' do
      expect(oliver.books.size).to eq 1
    end

    it 'adds the checked out book to persons book collection' do
      expected_content = @book_to_checkout[:item].merge({return_date: expected_return_date})
      expect(oliver.books).to include expected_content
    end

    it 'sets return date one month from now in librarys collection' do
      expect(@book_to_checkout[:return_date]).to eq expected_return_date
    end

    it 'sets return date one month from now in persons book collection' do
      expect(oliver.books.first[:return_date]).to eq expected_return_date
    end
  end
end
