require './lib/library.rb'
require 'date'

describe Library do
  books = [{title: 'The Secret',
            author: 'Rhonda Byrne',
            book_status: :avilable,
            person: :non,
            return_date: ''},
           {title: 'The Da Vinci Code',
            author: 'Dan Brown',
            book_status: :not_avilable,
            person: :user,
            return_date: "25-02-2016"}]

  subject { described_class.new(list_of_books: books) }

  let(:person) { double('person') }
  before do
    allow(person).to receive(:list_of_borrowed_book).and_return([])
  end
  it 'Has an array of books' do
    expect(subject.list_of_books).to be_kind_of Array
  end
  it 'tell the user that the book is already lended' do
      expect(subject.lend(person, title:'The Da Vinci Code')).to eq 'Sorry, this book is already lended'
  end
  it 'accept to retun book' do
      expect(subject.return_book(title:'The Da Vinci Code')).to eq 'The book has returned succesfully to the library'
  end
  it 'accept to set return date' do
      subject.lend(person,title:'The Secret')
      expect(subject.list_of_books.first[:return_date]).to eq Date.today.next_day(Library:: STANDARD_LENDING_DAYS).strftime('%d/%m/%y')
  end
  it 'accept to lend the book' do
     subject.lend(person,title:'The Secret')
      expect(subject.list_of_books.first[:return_date]).to eq Date.today.next_day(Library::STANDARD_LENDING_DAYS).strftime('%d/%m/%y')
  end
end
