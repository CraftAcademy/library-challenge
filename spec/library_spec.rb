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
        item: {
          title: "Harry Potter and Philosopher's Stone",
          author: 'J. K. Rowling',
        },
        available: true,
        return_date: nil,
      },
      {
        item: {
          title: 'Silk',
          author: 'Aleksandro Bariko',
        },
        available: true,
        return_date: nil,
      },
    ]
    expect(subject.available_books).to eq expected_output
  end

  it 'is expected to see a return date when a book is checked out' do
    # this spec alters data.yml file. Need to fix that
    title = 'Harry Potter and Philosopher\'s Stone'
    author = 'J. K. Rowling'
    return_date = Date.today.next_month
    expected_output =
      "Visitor have checked out #{title} by #{author} and will return it before #{return_date} "
    expect(subject.checkout(title)).to eq expected_output
  end

  it 'is expected to see an error message if the book is not available' do
    expect(subject.checkout('Agrā Rūsa')).to eq 'This book is not available'
  end

  it 'is expected to change books availability from true to false after a checkout' do
    #title = 'Harry Potter and Philosopher\'s Stone'
    #subject.checkout(title)
    #Cannot figure out how to do this part, in plain english my steps would be:
    #create a temporary test file so I don't change it with test data
    #run the specs/methods
    #check whether the file has changed
    #discard that test file
  end
end
