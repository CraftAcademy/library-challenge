require './lib/library.rb'

describe Library do
subject { described_class.new()}
  it 'should load available books from a file' do
  expect(subject.available_books.length).to eq 5
  end

  it ' should display title and author of available books' do
    first_item = subject.available_books[0]
    expect(first_item[:item][:title]).to be_truthy
    expect(first_item[:item][:author]).to be_truthy
  end
  it ' should print a book so it is readable' do
    item = {"title":"Easy and Short", "author": "Katy Perry"}
    expected_printout = "Easy and Short by Katy Perry"
    expect(subject.print_item_info(item)).to eq expected_printout

  end
end
