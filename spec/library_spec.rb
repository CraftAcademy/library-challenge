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

  it 'is expected to change books availability from true to false after a checkout' do
    title = 'Harry Potter and Philosopher\'s Stone'
    subject.checkout(title)
    subject.all_books[:available].to eq false
    #Cannot figure out how to do this part, in plain english my steps would be:

    #create a temporary test file so I don't change it with test data
    #run the specs/methods
    #check whether the file has changed
    #discard that test file
  end
end
