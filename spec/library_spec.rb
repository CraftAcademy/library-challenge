require './lib/library.rb'

describe Library do
  # As a library
  # In order to have good books to offer to the public
  # I would like to be able to have a collection of books

  it 'has book list on initialize' do
    expect(subject.book_list).not_to be_empty
  end

  # As a library
  # In order to lend a book to a Person
  # I would like to be able to find a book by its title
  it 'Return status true by searching the book title' do
    expected_output = subject.find('Pippi Långstrump')
    expect(expected_output[:status]).to be true
  end

  # As a library
  # In order to lend a book to a Person
  # I would like to find a book with same title and is available
  it 'Return status false if a book is not available' do
      expected_output = subject.find('Pippi Långstrump')
      expect(expected_output[:status]).to be false
  end

  # As a library
  # In order to have good books to offer to the public
  # I would like to be able to allow individuals to check out a book

  it 'Reduce books from its list for check out' do
    expected_output = subject.book_list.length - 1
    subject.checkout('Pippi Långstrump')
    expect(subject.book_list.length).to eq expected_output
  end

  # As a library
  # A book cannot be borrowed if it is not in the list

  it 'Show No book is found if checking out a book which is not in the list' do
      expected_output = {status: false, message:'No book is found'}
      expect(subject.checkout( {title: 'Learning XML', author:'Walter Johansson'})).to eq expected_output
  end

  # As a library
  # In order to make the books available to many individuals
  # I would like to set a return date on every check out
  # and I would like that date to be 1 month from checkout date
  it 'A success checkout should return a date with return date in one month from now' do
    return_date = Date.today + Library::LOAN_DURATION
    book = {title: 'Steve Jobs', author:'Walter Isaacsson'}
    expected_output = {status: true, book: book, return_date: return_date.strftime("%d/%m/%y")}
    expect(subject.checkout(book)).to eq expected_output
  end
end
