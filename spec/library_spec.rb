require './lib/library'
require './lib/person'
require 'yaml'

describe Library do

  let(:person) { instance_double('Person', name: 'Lisa') }

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

  it 'is expected that a person can search and borrow books' do
    expect(subject.select_books).to be_kind_of(Array)
  end

end
