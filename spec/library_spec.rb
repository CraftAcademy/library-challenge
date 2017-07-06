require './lib/library.rb'
require './lib/person.rb'
describe Library do
  person = Person.new("Carissa")
  subject { described_class.new()}
  it 'should load books from a file' do
    expect(subject.books.length).to eq 5
  end

  it 'should display title and author of available books' do
    first_item = subject.books[0]
    expect(first_item[:item][:title]).to be_truthy
    expect(first_item[:item][:author]).to be_truthy
  end

  it 'should print a book so it is readable' do
    item = {"title":"Easy and Short", "author": "Katy Perry"}
    expected_printout = "Easy and Short by Katy Perry"
    expect(subject.print_item_info(item)).to eq expected_printout
  end

  it 'should list only available books' do
    available_books = subject.available_books
    expect(available_books.length).to eq 4
  end

  #it 'should allow person to find a specific book'
  #allow(:person).to receive().and_return()

  it 'should be able to find a specific title in available books' do
    found_book = subject.find_available_book("Pippi Långstrump")
    expect(found_book).to be_truthy
  end

  it 'should allow person to pick a book by title and add to person' do
    expect(person.books.length).to eq 0
    subject.checkout_book(person, "Pippi Långstrump")
    expect(person.books.length).to eq 1
  end

end
