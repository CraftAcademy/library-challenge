require './lib/library.rb'

describe Library do
subject { described_class.new()}
  it 'should load available books from a file' do
  expect(subject.available_books.length).to eq 5
  end

  it ' should display title and author of available books' do
    first_book = subject.available_books[0]
    expect(first_book["title"]).to be_truthy
    expect(first_book["author"]).to be_truthy
  end
end
