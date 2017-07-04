require './lib/library.rb'
require './lib/person.rb'
describe Library do
  person = Person.new("Carissa")
  subject { described_class.new()}
  it 'should load books from a file' do
    expect(subject.books.length).to eq 5
  end

  it ' should display title and author of available books' do
    first_item = subject.books[0]
    expect(first_item[:item][:title]).to be_truthy
    expect(first_item[:item][:author]).to be_truthy
  end

  it ' should print a book so it is readable' do
    item = {"title":"Easy and Short", "author": "Katy Perry"}
    expected_printout = "[2]Easy and Short by Katy Perry"
    expect(subject.print_item_info(item,2)).to eq expected_printout
  end

  it ' should list only available books' do
    available_books = subject.available_books
    expect(available_books.length).to eq 4
  end

  #it 'should allow person to find a specific book'
  #allow(:person).to receive().and_return()

  it 'should allow person to checkout a specific book' do
    book_info = {
      :item => {
        :title => "Pippi Långstrump",
        :author => "Astrid Lindgren"
      },
      :available => true,
      :return_date => ''
    }

    expect(person.books.length).to eq 0
    subject.checkout_book(person, book_info)
    expect(person.books.length).to eq 1
    # Check that the persons book is the one that was chosen
    expected_printout = "[1]Pippi Långstrump by Astrid Lindgren"
    persons_book = person.books[0];
    expect(subject.print_item_info(persons_book, 1)).to eq expected_printout
  end

end
