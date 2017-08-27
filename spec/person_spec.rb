require './lib/person.rb'

describe Person do

let(:library) { instance_double('Library') }
let(:list) {double('book_list')}
let(:title) {double('title')}
let(:author) {double('author')}
subject { described_class.new(name: 'maggi')}



  it 'has name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'get a list of all the books' do
    allow(library).to receive(:list_books).and_return('list of books')
    expect(subject.list_all_books(library, list)).to eq 'list of books'
  end

  it 'get a list of available books' do
    allow(library).to receive(:books_available).and_return('list of available books')
    expect(subject.list_available_books(library, list)).to eq 'list of available books'
  end

  it 'can search by title' do
    allow(library).to receive(:search_by_title).and_return('list of books by title')
    expect(subject.list_by_title(library, list, title)).to eq 'list of books by title'
  end

  it 'can search by author' do
    allow(library).to receive(:search_by_author).and_return('list of books by author')
    expect(subject.list_by_author(library, list, title)).to eq 'list of books by author'
  end

  it 'can borrow a book' do
    allow(library).to receive(:borrow_a_book).and_return('here is your book')
    expect(subject.borrow_book(library, list, title)).to eq 'here is your book'
  end

  it 'can return a book' do
    allow(library).to receive(:return_a_book).and_return('thank you')
    expect(subject.return_book(library, list, title)).to eq 'thank you'
  end

  it 'can see when books are to be returned' do
    allow(library).to receive(:my_books_on_loan).and_return('you have these books')
    expect(subject.books_on_loan(library, list)).to eq 'you have these books'
  end
end
