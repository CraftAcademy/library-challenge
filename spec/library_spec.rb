require './lib/library'
require './lib/person'
require 'yaml'

describe Library do

  let(:person) { instance_double('Person', name: 'Lisa') }
#  subject { described_class.new(name: 'Lisa' )}

  it 'is expected to have a record of books on initialize' do
    expect(subject.books).not_to be nil
  end

  it 'is expected that the availability of books is presented' do
    expect { (subject.record_available_books).is_expected.to include(true) }
  end
=begin
  xit 'is expected a person can check out books' do
    expect(subject.loan_books(books)).to eq expected output
  end

  xit 'is expected that a book can be checked out for 1 month' do
    expected_date = Date.today.next_month(1).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
  end

  xit 'is expected that a user is informed of the book return due date' do
    expected_date = Date.today.next_month(1).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
  end
=end
end
