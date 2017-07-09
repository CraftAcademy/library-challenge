require './lib/library.rb'
require './lib/person.rb'
describe Library do
  let(:person) { Person.new('Carissa') }
  subject { described_class.new()}
  it 'should load books from a file' do
    expect(subject.books).to be_a Array
  end

  it 'should display title and author of available books' do
    first_item = subject.books[0]
    expect(first_item[:item][:title]).to eq "Alfons och soldatpappan"
    expect(first_item[:item][:author]).to eq "Gunilla Bergström"
  end

  it 'should list only available books' do
    available_books = subject.available_books
    expect(available_books.length).to eq 4
  end

  #it 'should allow person to find a specific book'
  #allow(:person).to receive().and_return()

  it 'should be able to find a specific title in available books' do
    found_book = subject.find_available_book("Pippi Långstrump")
    expect(found_book[:item][:title]).to eq "Pippi Långstrump"
  end

  it 'should allow person to pick a book by title and add to person' do
    expect(person.books.length).to eq 0
    subject.checkout_book(person, "Pippi Långstrump")
    expect(person.books.length).to eq 1
  end

  it 'should set available to false when book is checked out' do
    checked_out_book = subject.checkout_book(person, "Pippi Långstrump")
    expect(checked_out_book[:available]).to be false
  end

  it 'should set a return date when book is checked out' do
    checked_out_book = subject.checkout_book(person, "Pippi Långstrump")
    expect(checked_out_book[:return_date]).to eq subject.get_return_date
  end

end
