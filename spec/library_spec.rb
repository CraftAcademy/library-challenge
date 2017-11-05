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

  it 'expects to be able to let individuals to check out a book from the collection' do
    book_to_checkout = subject.collection[0]
    #person withdraws a book
    subject.checkout_book(book_to_checkout, oliver)
    #if he withdraws a book then the book should be unavailable
    binding.pry
    expect(subject.collection[0][:available]).to eq false
    expect(oliver.books.size).to eq 1
    expect(oliver.books).to include book_to_checkout[:item]
  end

end
