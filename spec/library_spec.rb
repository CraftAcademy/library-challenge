require './lib/library.rb'
require 'date'
RSpec.describe Library do
  subject { described_class.new }

  it 'is expected to have books' do
    expect(subject.all_books).to be_truthy
  end

  it 'is expected to see title and author of available books' do
    expected_output = [
      {
        title: "Harry Potter and Philosopher's Stone",
        author: 'J. K. Rowling',
      },
      { title: 'Silk', author: 'Aleksandro Bariko' },
    ]
    expect(subject.available_books).to eq expected_output
  end

  it 'is expected to see a return date when a book is checked out' do
    title = 'Harry Potter and Philosopher\'s Stone'
    author = 'J. K. Rowling'
    return_date = Date.today.next_month
    expected_output =
      "Visitor have checked out #{title} by #{author} and will return it before #{return_date} "
    expect(subject.checkout(title)).to eq expected_output
  end

  it 'is expected to not be able to check out book that is not available' do
    title = 'Harry Potter and Philosopher\'s Stone'
    author = 'J. K. Rowling'
  end
end
