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

  let(:book1) { double('book1',title:'The Secret',author: 'Rhonda Byrne') }
  let(:book2) { double('book2',title:'The Da Vinci Code',author: 'Dan Brown') }

  let(:person) { double('person') }
  let(:person2) { double('person2',list_of_borrowed_book:[{:title=>"Ruby",
    :author=>"Tarek", :book_status=>:not_avilable, :person=>:user, :return_date=>"08/02/16"}])}

  before do
    allow(person).to receive(:list_of_borrowed_book).and_return([])
  end

  it 'Has an array of books' do
    expect(subject.list_of_books).to be_kind_of Array
  end
  it 'tell that you have one overdue book to return' do
    expect(subject.lend(person2,book1)).to eq 'Sorry, you have one overdue book to return'
  end
  it 'tell the user that the book is already lended' do
      expect(subject.lend(person,book2)).to eq 'Sorry, this book is already lended'
  end
  it 'accept to retun book' do
      expect(subject.return_book(person,book2)).to eq 'The book has returned succesfully to the library'
  end
  it 'accept to lend the book' do
      expect(subject.lend(person,book2)).to eq 'The book has borrowed succesfully'
    end
end
