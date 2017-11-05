require './lib/library'
#require './lib/person'
require 'yaml'

describe Library do

  let(:person) { instance_double('Person', name: 'Lisa', books: [] ) }
  #subject { described_class.new() }

  it 'is expected to have a record of books on initialize' do
    expect(subject.books).not_to be nil
  end

  it 'is expected that the availability of books is presented' do
    expect { (subject.record_available_books).is_expected.to include(true) }
  end

  it 'is expected that a book can be checked out for 1 month' do
    expected_date = Date.today.next_month(1).strftime("%d/%m/%y")
    expect(subject.return_date).to eq expected_date
  end

  it 'is expected that a person can borrow books' do
    expected_date = Date.today.next_month(1).strftime("%d/%m/%y")
    expected_output = "Alfons och soldatpappan has been borrowed and is due " + expected_date
    subject.select_books_to_borrow("Alfons och soldatpappan", person)
  #  expect(subject.select_books_to_borrow("Alfons och soldatpappan", person)).to eq expected_output
  end

  xit 'is expected that a person can borrow books' do
    expected_output = "The book is not available"
    expect(subject.select_books_to_borrow("Alfons och soldatpappan", person)).to eq expected_output
  end

  xit 'is expected that a person can return books' do
    subject.select_books_to_return("Alfons och soldatpappan", person)
    expect(person.books).to be nil
  end
end
